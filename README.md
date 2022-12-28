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
  - Update variables within methods where possible (based on hints from abi for a method's output names, events, etc.)
- `abi.json`: While the source code of the smart contract may not be available, the original ABI is still available and was found on the original [Realms of Ether](https://realmsofether.com/) website.

## Contracts

Realms of Ether main contract
https://etherscan.io/address/0x0716d44d5991b15256a2de5769e1376d569bba7c

FortressStorage
https://etherscan.io/address/0x12e9b4B43A8e8788569BE5DF6fc3ed88780c4DfC

FortressStorage (Proxy?)
https://etherscan.io/address/0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a

BuildingStorage
https://etherscan.io/address/0x3ecFD43652462a9EDc06f5c4e3e65e1E9A1FAF24

BuildingStorage (Proxy?)
https://etherscan.io/address/0xb939a1d96dda7271d6d89eaceabd9163d0502165

TroupStorage
https://etherscan.io/address/0xAE066769aa0fC472f1ee10360e05f2a6d903c1f3

TroupStorage (Proxy?)
https://etherscan.io/address/0x902904b1833def4aef05b99cea93cc3383cd2d4a