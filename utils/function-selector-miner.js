/**
 * Function Selector Miner
 * 
 * Usage:
 *   node selector-miner.js <prefix> <selector> <words-file>
 * 
 * Examples:
 *   node selector-miner.js fortresses 0x5d694a72 ./my-words.txt
 * 
 * For each word in the dictionary, tries:
 *   prefix + CapitalizedWord + ()    →  fortressesAvailable()
 * 
 * The words file should have one word per line (plain text).
 */

'use strict';

const fs = require('fs');
const path = require('path');

// ── Keccak-256 (no dependencies) ─────────────────────────────────────────────

const KECCAK_RC = [
  0x0000000000000001n, 0x0000000000008082n, 0x800000000000808An,
  0x8000000080008000n, 0x000000000000808Bn, 0x0000000080000001n,
  0x8000000080008081n, 0x8000000000008009n, 0x000000000000008An,
  0x0000000000000088n, 0x0000000080008009n, 0x000000008000000An,
  0x000000008000808Bn, 0x800000000000008Bn, 0x8000000000008089n,
  0x8000000000008003n, 0x8000000000008002n, 0x8000000000000080n,
  0x000000000000800An, 0x800000008000000An, 0x8000000080008081n,
  0x8000000000008080n, 0x0000000080000001n, 0x8000000080008008n,
];
const KECCAK_RHO = [1,3,6,10,15,21,28,36,45,55,2,14,27,41,56,8,25,43,62,18,39,61,20,44];
const KECCAK_PI  = [10,7,11,17,18,3,5,16,8,21,24,4,15,23,19,13,12,2,20,14,22,9,6,1];
const MASK64 = (1n << 64n) - 1n;

function rotl64(x, n) {
  return ((x << BigInt(n)) | (x >> BigInt(64 - n))) & MASK64;
}

function keccak256selector(str) {
  const data = Buffer.from(str, 'utf8');
  const rate = 136;
  const state = new Array(25).fill(0n);

  const padded = Buffer.alloc(Math.ceil((data.length + 1) / rate) * rate, 0);
  data.copy(padded);
  padded[data.length] ^= 0x01;
  padded[padded.length - 1] ^= 0x80;

  for (let bs = 0; bs < padded.length; bs += rate) {
    for (let i = 0; i < rate / 8; i++) {
      const lo = padded.readUInt32LE(bs + i * 8);
      const hi = padded.readUInt32LE(bs + i * 8 + 4);
      state[i] ^= (BigInt(hi) << 32n) | BigInt(lo);
    }
    for (let round = 0; round < 24; round++) {
      // θ
      const C = Array.from({length: 5}, (_, x) =>
        state[x] ^ state[x+5] ^ state[x+10] ^ state[x+15] ^ state[x+20]);
      const D = Array.from({length: 5}, (_, x) =>
        C[(x+4)%5] ^ rotl64(C[(x+1)%5], 1));
      for (let x = 0; x < 25; x++) state[x] ^= D[x % 5];
      // ρ + π
      let last = state[1];
      for (let i = 0; i < 24; i++) {
        const x = KECCAK_PI[i];
        const tmp = state[x];
        state[x] = rotl64(last, KECCAK_RHO[i]);
        last = tmp;
      }
      // χ
      for (let y = 0; y < 25; y += 5) {
        const t = state.slice(y, y + 5);
        for (let x = 0; x < 5; x++) {
          state[y+x] = (t[x] ^ ((~t[(x+1)%5]) & t[(x+2)%5])) & MASK64;
        }
      }
      // ι
      state[0] = (state[0] ^ KECCAK_RC[round]) & MASK64;
    }
  }

  // Return first 4 bytes as hex selector string
  const out = Buffer.alloc(4);
  const lo = Number(state[0] & 0xFFFFFFFFn);
  out.writeUInt32LE(lo, 0);
  return '0x' + out.toString('hex');
}

// ── Main ─────────────────────────────────────────────────────────────────────

const prefix   = process.argv[2];
const targetIn = process.argv[3];
const wordFile = process.argv[4];

if (!prefix || !targetIn) {
  console.error('Usage: node selector-miner.js <prefix> <selector> [words-file]');
  console.error('');
  console.error('Examples:');
  console.error('  node selector-miner.js fortresses 0x5d694a72 ./words.txt');
  process.exit(1);
}

const target = targetIn.startsWith('0x') ? targetIn.toLowerCase() : '0x' + targetIn.toLowerCase();

// Load words
let rawWords;
if (wordFile) {
  rawWords = fs.readFileSync(path.resolve(wordFile), 'utf8');
  console.log(`Loaded dictionary from: ${wordFile}`);
} else {
  rawWords = BUILTIN_WORDS;
  console.log('Using built-in dictionary.');
}

const words = [...new Set(
  rawWords
    .split(/[\s,\n]+/)
    .map(w => w.trim().toLowerCase())
    .filter(w => w.length >= 2 && /^[a-z]+$/.test(w))
)];

console.log(`Dictionary size : ${words.length} words`);
console.log(`Prefix          : "${prefix}"`);
console.log(`Target selector : ${target}`);
console.log('');

// Check prefix alone first
const aloneHash = keccak256selector(`${prefix}()`);
if (aloneHash === target) {
  console.log(`✅ FOUND: ${prefix}()`);
  process.exit(0);
}

// Search
let checked = 1;
for (const word of words) {
  const capitalized = word.charAt(0).toUpperCase() + word.slice(1);
  const sig = `${prefix}${capitalized}()`;
  const hash = keccak256selector(sig);
  checked++;

  if (hash === target) {
    console.log(`✅ FOUND: ${sig}`);
    console.log(`   Selector: ${hash}`);
    process.exit(0);
  }
}

console.log(`❌ Not found after checking ${checked} combinations.`);