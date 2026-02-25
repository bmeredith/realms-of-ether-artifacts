// diff.js
const fs = require("fs");

function clean(hex) {
  hex = hex.trim().toLowerCase();
  if (hex.length % 2) throw new Error("odd-length hex");

  // remove 0x prefix
  if (hex.startsWith("0x")) hex = hex.slice(2);

  // strip trailing 43 bytes (CBOR metadata suffix) from both
  hex = hex.slice(0, -86);
  return hex;
}

function diff(a, b, ctxBytes = 32) {
  const len = Math.min(a.length, b.length);
  for (let i = 0; i < len; i += 2) {
    if (a.slice(i, i + 2) !== b.slice(i, i + 2)) {
      const start = Math.max(0, i - ctxBytes * 2);
      const end = Math.min(len, i + ctxBytes * 2);
      return { i, start, end };
    }
  }
  if (a.length !== b.length) return { i: len, start: Math.max(0, len - ctxBytes * 2), end: len };
  return null;
}

// Put your deployed and compiled runtime hex in two files:
const deployedFileFound = fs.existsSync("deployed.hex");
if (!deployedFileFound) {
  console.log('deployed.hex not found');
  process.exit(0);
}

const compiledFileFound = fs.existsSync("compiled.hex");
if (!compiledFileFound) {
  console.log('compiled.hex not found');
  process.exit(0);
}

const deployed = clean(fs.readFileSync("deployed.hex", "utf8"));
const compiled = clean(fs.readFileSync("compiled.hex", "utf8"));

const d = diff(deployed, compiled);
if (!d) {
  console.log("✅ Identical (same length and bytes).");
  process.exit(0);
}

console.log("❌ First mismatch at byte offset:", d.i / 2, "(hex index", d.i, ")");
console.log("deployed:", deployed.slice(d.start, d.end));
console.log("compiled:", compiled.slice(d.start, d.end));
console.log("deployed byte:", deployed.slice(d.i, d.i + 2));
console.log("compiled byte:", compiled.slice(d.i, d.i + 2));
console.log("lengths:", deployed.length / 2, "vs", compiled.length / 2, "bytes");