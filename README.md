# Realms of Ether Deconstructed

## Purpose

This repository is meant to provide a more in-depth look into the [Realms of Ether](https://realmsofether.com/) smart contract source code. The original smart contract source code remains unavailable and unverified, but using a few different techniques it is still possible to get a better idea of what lies within.

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

## Notes
- All method names are a 1-to-1 match of what would be within the original source code. Any method names that could not be identified have been left as the decompiled MethodID.
- Not all function parameter names or function output names are 1-to-1 match. Decompilation of those is not possible. It is a best effort to identify those and have the reconstructed contract more readable.

## Contracts

| **Contract**             | **Contract Address**                                                    |
|--------------------------|-------------------------------------------------------------------------|
| Realms of Ether          | https://etherscan.io/address/0x0716d44d5991b15256a2de5769e1376d569bba7c |
| FortressStorage          | https://etherscan.io/address/0x12e9b4B43A8e8788569BE5DF6fc3ed88780c4DfC |
| FortressStorage (Proxy?) | https://etherscan.io/address/0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a |
| BuildingStorage          | https://etherscan.io/address/0x3ecFD43652462a9EDc06f5c4e3e65e1E9A1FAF24 |
| BuildingStorage (Proxy?) | https://etherscan.io/address/0xb939a1d96dda7271d6d89eaceabd9163d0502165 |
| TroupStorage             | https://etherscan.io/address/0xAE066769aa0fC472f1ee10360e05f2a6d903c1f3 |
| TroupStorage (Proxy?)    | https://etherscan.io/address/0x902904b1833def4aef05b99cea93cc3383cd2d4a |

## Method/Event Identifiers

### Realms of Ether contract

| **Method**                                                                      | **MethodID** |
|---------------------------------------------------------------------------------|--------------|
| auctionEnd(bytes32)                                                             | 0x7621bd09d  |
| auctionOwner(bytes32)                                                           | 0xc73dedfd   |
| auctions(uint256)                                                               | 0x571a26a0   |
| balanceAuction(bytes32)                                                         | 0x093556c9   |
| balances(address)                                                               | 0x27e235e3   |
| bidAuction(bytes32)                                                             | 0xcacb7ad8   |
| build(bytes32,bytes32)                                                          | 0x30b654f8   |
| buildingAction(bytes32,bytes32)                                                 | 0xdc341d8d   |
| buildingStorage()                                                               | 0xed8faf3d   |
| createBuilding(bytes16,uint256,uint256,bytes32,uint256,uint256,uint256,uint256) | 0x2516930f   |
| createFortress(bytes16)                                                         | 0x5096ec53   |
| createTroup(bytes16,uint256,uint256,uint256,uint256,uint256,uint256,uint256)    | 0x974f1e9e   |
| endAuction(bytes32)                                                             | 0x01db46a0   |
| fortressStorage()                                                               | 0x0258a643   |
| getAuctionAmount(bytes32,address)                                               | 0xc9c0c242   |
| getAuctionsLength()                                                             | 0xdbe35007   |
| getBuilding(bytes32)                                                            | 0x66760ce6   |
| getBuildingCosts(bytes32)                                                       | 0x7bbe0176   |
| getBuildingHash(uint256)                                                        | 0xcb551a2b   |
| getBuildingIndexLength()                                                        | 0xd5ee9ca4   |
| getFortress(bytes32)                                                            | 0xc1666a30   |
| getFortressBuilding(bytes32,bytes32)                                            | 0x98a84292   |
| getFortressCount()                                                              | 0x10cfcf0c   |
| getFortressesAvailable()                                                        | 0x468c7804   |
| getFortressTroups(bytes32,bytes32)                                              | 0xc756b8e9   |
| getHashFromIndex(address,uint256)                                               | 0x78a11bf0   |
| getIndexLength(address)                                                         | 0xf5807181   |
| getResources(bytes32)                                                           | 0x8ca25ab4   |
| getTroup(bytes32)                                                               | 0x7e403f26   |
| getTroupCosts(bytes32)                                                          | 0x66cfc337   |
| getTroupHash(uint256)                                                           | 0x245454b5   |
| getTroupIndexLength()                                                           | 0x48d79c6f   |
| getUserAuctionsLength(address)                                                  | 0x82768573   |
| goldHash()                                                                      | 0x8764d2e2   |
| highestBid(bytes32)                                                             | 0x61508bfd   |
| highestBidder(bytes32)                                                          | 0xbf51e728   |
| owner()                                                                         | 0x8da5cb5b   |
| pause()                                                                         | 0x8456cb59   |
| paused()                                                                        | 0x5c975abb   |
| startAuction(bytes32)                                                           | 0xede8acdb   |
| startMinting()                                                                  | 0x9a65ea26   |
| stoneHash()                                                                     | 0x7f1c5886   |
| totalBalance()                                                                  | 0xad7a672f   |
| transferFortress(bytes32,address)                                               | 0x8063a94b   |
| transferOwnership(address)                                                      | 0xf2fde38b   |
| troupStorage()                                                                  | 0x40d7f8c0   |
| unpause()                                                                       | 0x3f4ba83a   |
| upgradeGame(address)                                                            | 0xe82acd26   |
| userAuctions(address,uint256)                                                   | 0xb4fbe80a   |
| withdraw(bytes32)                                                               | 0x8e19899e   |
| withdrawExcess(address)                                                         | 0xaffbf593   |
| woodHash()                                                                      | 0xa00fedc7   |

| **Event**                                                 | **EventID** |
|-----------------------------------------------------------|-------------|
| LogFortressCreated(bytes16,bytes32,address,int256,int256) | 0x39152486  |
| LogBuild(bytes32,bytes32)                                 | 0x9303befd  |
| LogBuildingAction(bytes32,bytes32)                        | 0x9afc6e84  |
| LogBuildingCreated(bytes32)                               | 0xc419dae1  |
| LogTroupCreated(bytes32)                                  | 0xa543a0fd  |