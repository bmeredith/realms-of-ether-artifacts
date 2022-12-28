# Realms of Ether Deconstructed

## Purpose

This repository is meant to serve to provide a more in-depth look into the [Realms of Ether](https://realmsofether.com/) smart contract source code. The original smart contract source code remains unavailable and unverified, but using a few different techniques, it is still possible to get a better idea of what lies within.

## Breakdown

- `decompiled.sol`: This is the untouched, decompiled smart contract, which was decompiled at [library.dedaub.com](https://library.dedaub.com/decompile).
- `deconstructed.sol`: This is the modified smart contract to reconstruct what is possible based on the decompilation+ABI. This includes:
  - Replacing method signatures with function names.
  - Changing function parameter types.
  - Changing function parameters to be named parameters, where possible.
  - Changing function access modifiers (view, payable, etc.).
  - Replacing event signatures with event names
  - Add the return type of function calls with named return types, where possible.
  - Update variables within methods where possible (based on hints from events, etc.)
- `abi.json`: While the source code of the smart contract may not be available, the original ABI is still available and was found on the original [Realms of Ether](https://realmsofether.com/) website.