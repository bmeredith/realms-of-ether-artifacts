# Realms of Ether Deconstructed

## Purpose

This repository is meant to serve to provide a more in-depth look into the [Realms of Ether](https://realmsofether.com/) smart contract source code. The original smart contract source code remains unavailable and unverified, but using a few different techniques, it is still possible to get a better idea of what lies within.

## Breakdown

- `decompiled.sol`: This is the untouched, decompiled smart contract which was decompiled by [library.dedaub.com](https://library.dedaub.com/decompile).
- `deconstructed.sol`: This is the modified smart contract to reconstruct what is possible based on the decompilation+ABI. This includes function names, parameter names, and parameter types.
- `abi.json`: While the source code of the smart contract may not be available, the original ABI is still available and was found on the original [Realms of Ether](https://realmsofether.com/) website.