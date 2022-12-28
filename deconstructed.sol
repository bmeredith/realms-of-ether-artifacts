/* 
    Methods and their method signature hashes:

    -endAuction(bytes32) 01db46a0b5954d4fe3758378fa9c3af018864d7c5b34ebabd2e228b748b9d298
    -fortressStorage() 0258a643df5aa03485a889fafee57bb4ddcc65cc2f7cf4a1533bb4b83a33e273
    -balanceAuction(bytes32) 093556c9f8b1de8d520b4cb13ff3f08f887160578d3abde023b0f558bbcee7ea
    -getFortressCount() 10cfcf0c2ce1e24e56a0e67360ea7ba647c6e673bc00d9e48a2c1e81276f6618
    -getTroupHash(uint256) 245454b5af1f53870ecc14d1d731b0209f6c5bf2051431df97a701cdccc3c46e
    -createBuilding(bytes16,uint256,uint256,bytes32,uint256,uint256,uint256,uint256) 2516930fd4849fda292dddb4c6f3bb897141e30a898738b98c04b9665a4a0cfe
    -balances(address) 27e235e3156ba7594b76cc352951bc4f5090802332ed790fadb70e555671e6ab
    -build(bytes32,bytes32) 30b654f82e8dfeed36f38ed4369e217e919381e3ef4c263ed8a0923c08b913a8
    -unpause() 3f4ba83af89dc9793996d9e56b8abe6dc88cd97c9c2bb23027806e9c1ffd54dc
    -troupStorage() 40d7f8c09f5158797609eb983115db25563fb6d44bb0f3052dc4cbaae1a02236
    -getFortressesAvailable() 468c780402383654087f19e5a6652217ffd0283b95583ede1ac06b25d3c61d17
    -getTroupIndexLength() 48d79c6f3e5e2a09f2d5ddb0d227f3f3b2a28a67fdd2e80564b6ad941a4b3def
    -createFortress(bytes16) 5096ec5397b17c62998ad05c7ff660e27013e6da6faa6de8370cad0ff126b292
    -auctions(uint256) 571a26a0cffc1c948fda84210cb62afc7643ba02d2fb487974595cf23e82273f
    -paused() 5c975abbf8c4d6efa68fc896e233763eb503f2318260b7bf59b19412913788b2
    -highestBid(bytes32) 61508bfdd6add8c726f043de9a2145fcdbf7f75d0a2de450f7d77125cb5c15ec
    -getBuilding(bytes32) 66760ce6a008662c55adeb13907c95eee93eb3c49e3a603e61644065a6fd68ec
    -getTroupCosts(bytes32) 66cfc3371dc5446c272da0fa4708f7ded6a1433cc0ddb28223d8b40b995a22b6
    -auctionEnd(bytes32) 7621bd09d80fe668b6f1e65fcde2080eb50cdd68e5db3d79bddd2b4c653ae7be
    -getHashFromIndex(address,uint256) 78a11bf00dc758f3a95ae87862fda745b78d58655cf4d5218fd94ace16409d18
    -getBuildingCosts(bytes32) 7bbe01764019c4b4dcf5b26bce2e531e44b9409b327b2324d0f95d9436db4bbe
    -getTroup(bytes32) 7e403f26d25892cfad809777be063cd02d3516653aa32ebefc2a75cadf2fa3fa
    -stoneHash() 7f1c5886ecbce5b34aff8127cefe8a6810d36a20b68cf7fd83c4690e02036b75
    -transferFortress(bytes32,address) 8063a94beb62e28d04f79c53b577bcc98490aae9b4e2e7de938ccb01f03bf047
    -getUserAuctionsLength(address) 82768573fff3f3eb2621a0489b7b40baef8909a915d0abe9003a66cbbe281828
    -pause() 8456cb591a934d53f6ccc6332123a165a1f3562907bf11330d847a29ca49eb89
    -goldHash() 8764d2e273eb8676b1edd002d7efa3ac22adb44589a4c9ce973e58843f647a34
    -getResources(bytes32) 8ca25ab490b59a4123ae1e045258589ba6fe540608ec7ba132bfe0e904a6d656
    -owner() 8da5cb5b36e7f68c1d2e56001220cdbdd3ba2616072f718acfda4a06441a807d
    -withdraw(bytes32) 8e19899e46957c7ebdf7f6745205163d4595f9439395ecae5a8119cc5cad663e
    -createTroup(bytes16,uint256,uint256,uint256,uint256,uint256,uint256,uint256) 974f1e9e43031dd1070ed2cba5c533a058a1bcda889185b7d86ef20405b8d1b9
    -getFortressBuilding(bytes32,bytes32) 98a842927cb31cb4832cc9f2c4a5be0a83f403567ebaf6804d41ec8c47f728d4
    -startMinting() 9a65ea262a348038d5bf20afd267cfda3881a7cb988958b7271adde74351ae95
    -woodHash() a00fedc77ab13a5630eea6285c1207340f636164bd40c0bda7811404b7cd43fb
    -totalBalance() ad7a672fba2833726315cc78ca49d737d6a104d6eb4a4d86bc6efce8005ccdd7
    -withdrawExcess(address) affbf593affef99041c8224bf702ff33cac18e4b6872f33315ffe35303e9df7d
    -userAuctions(address,uint256) b4fbe80a6ea739908cedc50d9c0bc110a00ca017a282d936e1d773b56b492737
    -highestBidder(bytes32) bf51e728675076136b0ec3ec142e97e2947a7bfd0c2cc3ff48e6dc11473bf839
    -getFortress(bytes32) c1666a307f472a371a689e71b7f5119469d138ae5c9afa6b22a7c836a9672462
    -auctionOwner(bytes32) c73dedfd452f69f3fe949b4d8eaf4b78ada0b281ea2d80c385574a89b2b13677
    -getFortressTroups(bytes32,bytes32) c756b8e9345cf04627529285f6286baa383df5fc479064fb6cf48236a5fe817f
    -getAuctionAmount(bytes32,address) c9c0c2426434f646d6790784e46f13b8986eb4bb51bd71a8f7b328ae501a9d7a
    -bidAuction(bytes32) cacb7ad8d565c763cb3be3334b448011f170368de9509eaaa79385c2eb6c522a
    -getBuildingHash(uint256) cb551a2b74fb546ba379e5f6a6324a8a277dabf99c6fd793765d81e544780e76
    -getBuildingIndexLength() d5ee9ca4ff1a80ad6bf34c1c7f7dd8de3d29f9c97c0121b2a472186abc12a329
    -getAuctionsLength() dbe350077d39d435184bb0bfa5715814a703f234258804bd5b96dfd6a2cb3fb2
    -buildingAction(bytes32,bytes32) dc341d8d8eb91836b31635670223b8bc31580539b53d6250afe6f40d479057d6
    -upgradeGame(address) e82acd26d61b58eaaa9943f99afa5e496d2c56cb5c2ed9d406e05d01811eef53
    -buildingStorage() ed8faf3dccebaea7874ac254b4517324fa02477f4db2980adee53cf9e711d882
    -startAuction(bytes32) ede8acdb10d4c74c26ab4f7606d22fb66fbf5942b94b40a286b1019f650c5cbd
    -transferOwnership(address) f2fde38b092330466c661fc723d5289b90272a3e580e3187d1d7ef788506c557
    -getIndexLength(address) f5807181d671045f62749f521a02261f0bdaef31382e98a76715da56d0760077
*/

/*
    Events and their signature hashes:

    -LogFortressCreated(bytes16,bytes32,address,int256,int256) 39152486560cc8ff27042032d9bb477500eca5162f3415779350075bcfc05c8e
    -LogBuild(bytes32,bytes32) 9303befd891bc5843e6997e792f1908586d704459200b41377769d33f733fef9
    -LogBuildingAction(bytes32,bytes32) 9afc6e84262b245e3a80ef387f2b777dfe649ffc2eed92f9375b893a5539b0ca
    -LogBuildingCreated(bytes32) c419dae1c5cabdd3bc2861f0a8137963291d13cf042875f96fd1a297396c4a6f
    -LogTroupCreated(bytes32) a543a0fdbe4c677f8ac450772f98d34ced6e7ed99d9876cd73c0e132d35f791c
*/

// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
bytes32 _goldHash; // STORAGE[0x5]
bytes32 _woodHash; // STORAGE[0x6]
bytes32 _stoneHash; // STORAGE[0x7]
mapping (uint256 => [uint256]) owner_8; // STORAGE[0x8]
mapping (uint256 => [uint256]) owner_9; // STORAGE[0x9]
mapping (uint256 => [uint256]) owner_a; // STORAGE[0xa]
mapping (bytes32 => address) _highestBidder; // STORAGE[0xb] - holds mappings of FortressHashes -> Address for auctions
mapping (uint256 => [uint256]) owner_c; // STORAGE[0xc]
mapping (uint256 => [uint256]) owner_d; // STORAGE[0xd]
mapping (address => uint256) _balances; // STORAGE[0xe]
uint256 _totalBalance; // STORAGE[0xf]
bytes32[] _getAuctionsLength; // STORAGE[0x10] - holds list of FortressHashes that are being auctioned
uint256 _x; // STORAGE[0x11]
uint256 _y; // STORAGE[0x12]
uint256 stor_13; // STORAGE[0x13]
uint256 stor_14; // STORAGE[0x14]
address _owner; // STORAGE[0x0] bytes 0 to 19
address _fortressStorage; // STORAGE[0x2] bytes 0 to 19
bool _paused; // STORAGE[0x0] bytes 20 to 20
address _buildingStorage; // STORAGE[0x3] bytes 0 to 19
address _troupStorage; // STORAGE[0x4] bytes 0 to 19

// Events
Unpause();
Pause();
OwnershipTransferred(address, address);

function 0x12cc(bytes32 _buildingHash) private { 
    MEM[160 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1, v2, v3, v4, v5 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0x9d3bd2e4, _buildingStorage, _buildingHash).gas(msg.gas - 710); // getBuilding(address,bytes32) 9d3bd2e498f6ead5d362d6678757c13559fba40d06da9714eb0087c36562a9c3
    require(v0);
    return MEM[128 + MEM[64]], MEM[96 + MEM[64]], MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1393(bytes32 _troupHash) private { 
    MEM[96 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1, v2, v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xfc85a0d2, _troupStorage, _troupHash).gas(msg.gas - 710); // getCosts(address,bytes32) fc85a0d2e698f56a6fec311b48e42bf692a4a75aededc95723aec8ebdd82bd65
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x14f4(bytes32 _buildingHash) private { 
    MEM[96 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1, v2, v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xfc85a0d2, _buildingStorage, _buildingHash).gas(msg.gas - 710); // getCosts(address,bytes32) fc85a0d2e698f56a6fec311b48e42bf692a4a75aededc95723aec8ebdd82bd65
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1749(bytes32 _fortressHash) private returns (uint256, uint256, uint256) { 
    MEM[96 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1, v2, v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x58e9eb78, _fortressStorage, _fortressHash).gas(msg.gas - 710); // getResources(address,bytes32) 58e9eb78cedc5fb26b0d82bce0a61dda647bb048722bf8108417516a6c9a96ab
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1a67(bytes32 _buildingHash, bytes32 _fortressHash) private { 
    MEM[64 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1, v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x4e49bbe1, _fortressStorage, _fortressHash, _buildingHash).gas(msg.gas - 710); // getBuilding(address,bytes32,bytes32) 4e49bbe118e01704e0e75511c0d2245ea40edf1366fc6b00fc6e94448682f860
    require(v0);
    return v2, v1;
}

function 0x1d04(bytes32 _troupHash, bytes32 _fortressHash) private { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xfd1fd5ff, _fortressStorage, _fortressHash, _troupHash).gas(msg.gas - 710); // getTroups(address,bytes32,bytes32) fd1fd5ffa3daa90749e9d413b81d2d9c0ac77962670a39cc9a585aaf6db7b76d
    require(v0);
    return MEM[MEM[64]];
}

function () public payable { 
    revert();
}

function endAuction(bytes32 _fortressHash) public { 
    require(!_paused);
    require(owner_8[_fortressHash] <= block.timestamp);
    require(_highestBidder[_fortressHash] == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf1ed0c6, _fortressStorage, _fortressHash, msg.sender).gas(msg.gas - 710);
    require(v0);
    assert(owner_a[_fortressHash] <= _balances[msg.sender]);
    _balances[msg.sender] = _balances[msg.sender] - owner_a[_fortressHash];
    _balances[keccak256(_fortressHash, msg.sender)] = 0;
    v1 = keccak256(_fortressHash, address(owner_9[keccak256(_fortressHash, msg.sender)]));
    assert(owner_9[keccak256(_fortressHash, msg.sender)] + owner_9[v1] >= owner_9[v1]);
    owner_d[v1] = owner_9[keccak256(_fortressHash, msg.sender)] + owner_9[v1];
    assert(owner_a[v1] + owner_9[address(owner_9[v1])] >= owner_9[address(owner_9[v1])]);
    owner_9[address(owner_9[_fortressHash])] = owner_a[v1] + owner_9[address(owner_9[v1])];
}

function 0x26af(uint256 varg0) private { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x69c5b2b8, _fortressStorage, varg0).gas(msg.gas - 710);
    require(v0);
    require(address(v1) == msg.sender);
    return ;
}

function fortressStorage() public view returns (address) { 
    return _fortressStorage;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        assert(v0 / varg1 == varg0);
        return v0;
    } else {
        return 0;
    }
}

function balanceAuction(bytes32 varg0) public view returns(uint256) { 
    return owner_d[varg0];
}

function getFortressCount() public view returns(uint256) { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x3f0a6f3d, _fortressStorage).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getTroupHash(uint256 _index) public view returns (bytes32) { 
    MEM[32 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.getHash(_troupStorage, _index).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function createBuilding(bytes16 _name, uint256 _action, uint256 _actionRate, bytes32 _actionValue, uint256 _actionTimeout, uint256 _gold, uint256 _wood, uint256 _stone) public { 
    require(_owner == msg.sender);
    buildingHash = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (_name & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xf481d125, _buildingStorage, buildingHash, _name & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, _action, _actionRate, _actionValue, _actionTimeout, _gold, _wood, _stone).gas(msg.gas - 710);
    require(v1);
    emit LogBuildingCreated(buildingHash);
    stor_1 += 1;
}

function balances(address varg0) public view returns (uint256) { 
    return _balances[varg0];
}

function build(bytes32 _fortressHash, bytes32 _buildingHash) public { 
    require(!_paused);
    0x26af(_fortressHash);
    v0, v1, v2 = 0x1749(_fortressHash);
    v3, v4, v5 = 0x14f4(_buildingHash);
    v6, v7 = 0x1a67(_buildingHash, _fortressHash);
    assert(1 + v7 >= v7);
    v8 = _SafeMul(1 + v7, v5);
    v9 = _SafeMul(1 + v7, v4);
    v10 = _SafeMul(1 + v7, v3);
    v11 = v12 = v2 >= v8;
    if (v12) {
        v11 = v13 = v1 >= v9;
    }
    if (v11) {
        v11 = v14 = v0 >= v10;
    }
    require(v11);
    assert(v8 <= v2);
    assert(v9 <= v1);
    assert(v10 <= v0);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x7b2be003, _fortressStorage, _fortressHash, _buildingHash, v2 - v8, v1 - v9, v0 - v10, 1 + v7).gas(msg.gas - 710);
    require(v15);
    emit LogBuild(_fortressHash, _buildingHash);
}

function unpause() public { 
    require(_owner == msg.sender);
    require(_paused);
    _paused = false;
    emit Unpause();
}

function troupStorage() public view returns (address) { 
    return _troupStorage;
}

function getFortressesAvailable() public view returns (uint256) { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1777d529, _fortressStorage).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getTroupIndexLength() public view returns (uint256) { 
    MEM[32 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xf5807181, _troupStorage).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function createFortress(bytes16 _name) public payable { 
    require(!_paused);
    require(msg.value >= 0x2386f26fc10000);
    fortressHash = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (_name & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xbd1fb981, _fortressStorage, fortressHash, _name & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, _x, _y, 200, 400, 500, 0, msg.sender).gas(msg.gas - 710);
    require(v1);
    v2 = v3 = _x == _y;
    if (_x != _y) {
        v2 = v4 = _x < 0;
        if (v4) {
            v2 = v5 = _x == 0 - _y;
        }
    }
    if (!v2) {
        v2 = v6 = _x > 0;
        if (v6) {
            v2 = v7 = _x == 1 - _y;
        }
    }
    if (v2) {
        stor_13 = 0 - stor_14;
        stor_14 = stor_13;
    }
    _x += stor_13;
    _y += stor_14;
    emit LogFortressCreated(_name & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, fortressHash, msg.sender, _x, _y);
    stor_1 += 1;
}

function auctions(uint256 _auctionId) public view returns (bytes32) { 
    assert(_auctionId < _getAuctionsLength.length);
    return _getAuctionsLength[_auctionId];
}

function paused() public view returns (bool) { 
    return _paused;
}

function highestBid(bytes32 varg0) public view returns (uint256) { 
    return owner_a[varg0];
}

function getBuilding(bytes32 _buildingHash) public view { 
    v0, v1, v2, v3, v4 = 0x12cc(_buildingHash);
    return v4 & ~0xffffffffffffffffffffffffffffffff, v3, v2, v1, v0;
}

function getTroupCosts(bytes32 _troupHash) public view { 
    v0, v1, v2 = 0x1393(_troupHash);
    return v2, v1, v0;
}

function auctionEnd(bytes32 varg0) public view returns (uint256) { 
    return owner_8[varg0];
}

function getHashFromIndex(address _user, uint256 _index) public view returns (bytes32) { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x54c711ba, _fortressStorage, address(_user), _index).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getBuildingCosts(bytes32 _buildingHash) public view returns (uint256 _gold, uint256 _stone, uint256 _wood) { 
    (_gold, _stone, _wood) = 0x14f4(_buildingHash);
    return (_wood, _stone, _gold);
}

function getTroup(bytes32 _troupHash) public view { 
    MEM[160 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1, v2, v3, v4, v5 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0x2a33569e, _troupStorage, _troupHash).gas(msg.gas - 710);
    require(v0);
    return v1 & ~0xffffffffffffffffffffffffffffffff, v2, v3, v4, v5;
}

function stoneHash() public view returns (bytes32) { 
    return _stoneHash;
}

function transferFortress(bytes32 _fortressHash, address _newOwner) public { 
    require(!_paused);
    0x26af(_fortressHash);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xb844ad67, _fortressStorage, _fortressHash, _newOwner).gas(msg.gas - 710);
    require(v0);
}

function getUserAuctionsLength(address _user) public view returns (uint256) { 
    return owner_c[_user];
}

function pause() public { 
    require(_owner == msg.sender);
    require(!_paused);
    _paused = true;
    emit Pause();
}

function goldHash() public view returns (bytes32) { 
    return _goldHash;
}

function getResources(bytes32 _fortressHash) public view returns (uint256 _wood, uint256 _stone, uint256 _gold) { 
    (_gold, _stone, _wood) = 0x1749(_fortressHash);
    return (_wood, _stone, _gold);
}

function owner() public view returns (address) { 
    return _owner;
}

function withdraw(bytes32 _fortressHash) public { 
    require(!_paused);
    require(owner_8[_fortressHash] <= block.timestamp);
    require(_highestBidder[_fortressHash] != msg.sender);
    owner_d[keccak256(_fortressHash, msg.sender)] = 0;
    assert(owner_d[keccak256(_fortressHash, msg.sender)] <= _balances[msg.sender]);
    _balances[msg.sender] = _balances[msg.sender] - owner_d[keccak256(_fortressHash, msg.sender)];
    assert(owner_d[keccak256(_fortressHash, msg.sender)] <= _totalBalance);
    _totalBalance = _totalBalance - owner_d[keccak256(_fortressHash, msg.sender)];
    v0 = msg.sender.call().value(owner_d[keccak256(_fortressHash, msg.sender)]).gas(2300 * !owner_d[keccak256(_fortressHash, msg.sender)]);
    require(v0);
}

function createTroup(bytes16 _name, uint256 _life, uint256 _strength, uint256 _intelligence, uint256 _dexterity, uint256 _gold, uint256 _wood, uint256 _stone) public { 
    require(_owner == msg.sender);
    troupHash = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (_name & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0x93fdc929, _troupStorage, troupHash, _name & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, _life, _strength, _intelligence, _dexterity, _gold, _wood, _stone).gas(msg.gas - 710);
    require(v1);
    emit LogTroupCreated(troupHash);
    stor_1 += 1;
}

function getFortressBuilding(bytes32 _fortressHash, bytes32 _buildingHash) public view { 
    v0, v1 = 0x1a67(_buildingHash, _fortressHash);
    return v1, v0;
}

function startMinting() public { 
    require(_owner == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xd87f3856, _fortressStorage).gas(msg.gas - 710);
    require(v0);
}

function woodHash() public view returns (bytes32) { 
    return _woodHash;
}

function totalBalance() public view returns (uint256) { 
    return _totalBalance;
}

function withdrawExcess(address _withdraw) public { 
    require(_owner == msg.sender);
    assert(_totalBalance <= (address(this)).balance);
    v0 = _withdraw.call().value((address(this)).balance - _totalBalance).gas(!((address(this)).balance - _totalBalance) * 2300);
    require(v0);
}

function userAuctions(address varg0, uint256 varg1) public view returns (bytes32) { 
    assert(varg1 < owner_c[varg0]);
    return STORAGE[keccak256(keccak256(varg0, 12)) + varg1];
}

function highestBidder(bytes32 _fortressHash) public view returns (address) { 
    return _highestBidder[_fortressHash];
}

function getFortress(bytes32 _fortressHash) public view returns (bytes16 _name, address _owner, int256 _x, int256 _y, uint256 _wins) { 
    MEM[160 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    (v0, _name, _owner, _x, _y, _wins) = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xd041e57, _fortressStorage, _fortressHash).gas(msg.gas - 710);
    require(v0);
    _name = _name & ~0xffffffffffffffffffffffffffffffff;
    return (_name, _owner, _x, _y, _wins);
}

function auctionOwner(bytes32 varg0) public view returns (address) { 
    return address(owner_9[varg0]);
}

function getFortressTroups(bytes32 _fortressHash, bytes32 _troupHash) public view (uint256 _amount) { 
    v0 = 0x1d04(_troupHash, _fortressHash);
    return v0;
}

function getAuctionAmount(bytes32 _fortressHash, address _user) public view returns (uint256) { 
    return owner_d[keccak256(_fortressHash, _user)];
}

function bidAuction(bytes32 _fortressHash) public payable { 
    require(!_paused);
    require(block.timestamp < owner_8[_fortressHash]);
    assert(0x3f480 <= owner_8[_fortressHash]);
    require(block.timestamp > owner_8[_fortressHash] - 0x3f480);
    assert(100);
    v0 = _SafeMul(1, msg.value / 100);
    assert(v0 <= msg.value);
    v1 = keccak256(_fortressHash, msg.sender);
    if (!owner_d[v1]) {
        owner_c[msg.sender] = owner_c[msg.sender] + 1;
        if (!owner_c[msg.sender] <= owner_c[msg.sender] + 1) {
            v2 = v3 = owner_c[msg.sender] + 1 + keccak256(keccak256(msg.sender, 12));
            while (keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender] > v2) {
                STORAGE[v2] = 0;
                v2 += 1;
            }
            goto 0x1ec9B0x760;
        }
        STORAGE[keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender]] = _fortressHash;
    }
    assert(msg.value - v0 + owner_d[v1] >= owner_d[v1]);
    owner_d[v1] += msg.value - v0;
    assert(msg.value - v0 + _balances[msg.sender] >= _balances[msg.sender]);
    _balances[msg.sender] += msg.value - v0;
    assert(msg.value - v0 + _totalBalance >= _totalBalance);
    _totalBalance += msg.value - v0;
    assert(0x2386f26fc10000 + owner_a[_fortressHash] >= owner_a[_fortressHash]);
    if (owner_d[v1] < 0x2386f26fc10000 + owner_a[_fortressHash]) {
        goto 0x35f7;
    } else {
        owner_a[v1] = owner_d[v1];
        owner_a[v1] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & owner_a[v1];
    }
}

function getBuildingHash(uint256 _index) public view returns (bytes32) { 
    MEM[32 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.getHash(_buildingStorage, _index).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getBuildingIndexLength() public view returns (uint256) { 
    MEM[32 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xf5807181, _buildingStorage).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getAuctionsLength() public view returns (uint256) { 
    return _getAuctionsLength.length;
}

function buildingAction(bytes32 _fortressHash, bytes32 _buildingHash) public { 
    require(!_paused);
    0x26af(_fortressHash);
    v0, v1 = 0x1a67(_buildingHash, _fortressHash);
    require(block.timestamp > v0);
    v2, _troupHash, v4, v5, v6 = 0x12cc(_buildingHash);
    (_wood, _stone, _gold) = 0x1749(_fortressHash);
    if (v5 == 1) {
        if (_troupHash == _goldHash) {
            assert(1 + v1 >= v1);
            v10 = _SafeMul(1 + v1, v4);
            assert(v10 + _gold >= _gold);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v11 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1253a59c, _fortressStorage, _fortressHash, v10 + _gold).gas(msg.gas - 710);
            require(v11);
        }
        if (_troupHash == _stoneHash) {
            assert(1 + v1 >= v1);
            v12 = _SafeMul(1 + v1, v4);
            assert(v12 + _stone >= _stone);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v13 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x985a78d3, _fortressStorage, _fortressHash, v12 + _stone).gas(msg.gas - 710);
            require(v13);
        }
        if (_troupHash == _woodHash) {
            assert(1 + v1 >= v1);
            v14 = _SafeMul(1 + v1, v4);
            assert(v14 + _wood >= _wood);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xa04e8cb9, _fortressStorage, _fortressHash, v14 + _wood).gas(msg.gas - 710);
            require(v15);
        }
    }
    if (2 == v5) {
        v16 = 0x1d04(_troupHash, _fortressHash);
        v17, v18, v19 = 0x1393(_troupHash);
        v20 = _SafeMul(v1, v4);
        assert(1 + v20 >= v20);
        v21 = _SafeMul(1 + v20, v19);
        v22 = _SafeMul(1 + v20, v18);
        v23 = _SafeMul(1 + v20, v17);
        v24 = v25 = _gold >= v21;
        if (v25) {
            v24 = v26 = _stone >= v22;
        }
        if (v24) {
            v24 = _wood >= v23;
        }
        require(v24);
        assert(v21 <= _gold);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v27 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1253a59c, _fortressStorage, _fortressHash, _gold - v21).gas(msg.gas - 710);
        require(v27);
        assert(v22 <= _stone);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v28 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x985a78d3, _fortressStorage, _fortressHash, _stone - v22).gas(msg.gas - 710);
        require(v28);
        assert(v23 <= _wood);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v29 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xa04e8cb9, _fortressStorage, _fortressHash, _wood - v23).gas(msg.gas - 710);
        require(v29);
        assert(1 + v20 + v16 >= v16);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v30 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x56c1c099, _fortressStorage, _fortressHash, _troupHash, 1 + v20 + v16).gas(msg.gas - 710);
        require(v30);
    }
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v31 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf28c3ee3, _fortressStorage, _fortressHash, _buildingHash, v2 * 3600 + block.timestamp).gas(msg.gas - 710);
    require(v31);
    emit LogBuildingAction(_fortressHash, _buildingHash);
}

function upgradeGame(uint256 _newContract) public { 
    require(_owner == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.upgrade(_fortressStorage, address(_newContract)).gas(msg.gas - 710);
    require(v0);
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.upgrade(_buildingStorage, address(_newContract)).gas(msg.gas - 710);
    require(v1);
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v2 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.upgrade(_troupStorage, address(_newContract)).gas(msg.gas - 710);
    require(v2);
}

function buildingStorage() public view returns (address) { 
    return _buildingStorage;
}

function startAuction(bytes32 _fortressHash) public { 
    require(!_paused);
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x69c5b2b8, _fortressStorage, _fortressHash).gas(msg.gas - 710);
    require(v0);
    require(address(v1) == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf1ed0c6, _fortressStorage, varg0, address(this)).gas(msg.gas - 710);
    require(v2);
    _highestBidder[_fortressHash] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _highestBidder[_fortressHash];
    owner_a[_fortressHash] = 0;
    owner_9[_fortressHash] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & owner_9[_fortressHash];
    owner_9[_fortressHash] = block.timestamp + 0x3f480;
    owner_c[msg.sender] = owner_c[msg.sender] + 1;
    if (!owner_c[msg.sender] <= owner_c[msg.sender] + 1) {
        v3 = v4 = owner_c[msg.sender] + 1 + keccak256(keccak256(msg.sender, 12));
        while (keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender] > v3) {
            STORAGE[v3] = 0;
            v3 += 1;
        }
        goto 0x2546;
    }
    STORAGE[keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender]] = _fortressHash;
    _getAuctionsLength.length = _getAuctionsLength.length + 1;
    if (!_getAuctionsLength.length <= _getAuctionsLength.length + 1) {
        v5 = v6 = _getAuctionsLength.length + 1 + keccak256(16);
        while (keccak256(16) + _getAuctionsLength.length > v5) {
            STORAGE[v5] = 0;
            v5 += 1;
        }
        goto 0x2567;
    }
    _getAuctionsLength[_getAuctionsLength.length] = _fortressHash;
}

function transferOwnership(address newOwner) public { 
    require(_owner == msg.sender);
    require(newOwner);
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}

function getIndexLength(address _user) public view returns (uint256) { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x6dff11, _fortressStorage, _user).gas(msg.gas - 710);
    require(v0);
    return v1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x1db46a0) {
            endAuction(bytes32);
        } else if (0x258a643 == v0) {
            fortressStorage();
        } else if (0x93556c9 == v0) {
            balanceAuction(bytes32);
        } else if (0x10cfcf0c == v0) {
            getFortressCount();
        } else if (0x245454b5 == v0) {
            getTroupHash(uint256);
        } else if (0x2516930f == v0) {
            createBuilding(bytes16,uint256,uint256,bytes32,uint256,uint256,uint256,uint256);
        } else if (0x27e235e3 == v0) {
            balances(address);
        } else if (0x30b654f8 == v0) {
            build(bytes32,bytes32);
        } else if (0x3f4ba83a == v0) {
            unpause();
        } else if (0x40d7f8c0 == v0) {
            troupStorage();
        } else if (0x468c7804 == v0) {
            getFortressesAvailable();
        } else if (0x48d79c6f == v0) {
            getTroupIndexLength();
        } else if (0x5096ec53 == v0) {
            createFortress(bytes16);
        } else if (0x571a26a0 == v0) {
            auctions(uint256);
        } else if (0x5c975abb == v0) {
            paused();
        } else if (0x61508bfd == v0) {
            highestBid(bytes32);
        } else if (0x66760ce6 == v0) {
            getBuilding(bytes32);
        } else if (0x66cfc337 == v0) {
            getTroupCosts(bytes32);
        } else if (0x7621bd09 == v0) {
            auctionEnd(bytes32);
        } else if (0x78a11bf0 == v0) {
            getHashFromIndex(address,uint256);
        } else if (0x7bbe0176 == v0) {
            getBuildingCosts(bytes32);
        } else if (0x7e403f26 == v0) {
            getTroup(bytes32);
        } else if (0x7f1c5886 == v0) {
            stoneHash();
        } else if (0x8063a94b == v0) {
            transferFortress(bytes32,address);
        } else if (0x82768573 == v0) {
            getUserAuctionsLength(address);
        } else if (0x8456cb59 == v0) {
            pause();
        } else if (0x8764d2e2 == v0) {
            goldHash();
        } else if (0x8ca25ab4 == v0) {
            getResources(bytes32);
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0x8e19899e == v0) {
            withdraw(bytes32);
        } else if (0x974f1e9e == v0) {
            createTroup(bytes16,uint256,uint256,uint256,uint256,uint256,uint256,uint256);
        } else if (0x98a84292 == v0) {
            getFortressBuilding(bytes32,bytes32);
        } else if (0x9a65ea26 == v0) {
            startMinting();
        } else if (0xa00fedc7 == v0) {
            woodHash();
        } else if (0xad7a672f == v0) {
            totalBalance();
        } else if (0xaffbf593 == v0) {
            withdrawExcess(address);
        } else if (0xb4fbe80a == v0) {
            userAuctions(address,uint256);
        } else if (0xbf51e728 == v0) {
            highestBidder(bytes32);
        } else if (0xc1666a30 == v0) {
            getFortress(bytes32);
        } else if (0xc73dedfd == v0) {
            auctionOwner(bytes32);
        } else if (0xc756b8e9 == v0) {
            getFortressTroups(bytes32,bytes32);
        } else if (0xc9c0c242 == v0) {
            getAuctionAmount(bytes32,address);
        } else if (0xcacb7ad8 == v0) {
            bidAuction(bytes32);
        } else if (0xcb551a2b == v0) {
            getBuildingHash(uint256);
        } else if (0xd5ee9ca4 == v0) {
            getBuildingIndexLength();
        } else if (0xdbe35007 == v0) {
            getAuctionsLength();
        } else if (0xdc341d8d == v0) {
            buildingAction(bytes32,bytes32);
        } else if (0xe82acd26 == v0) {
            upgradeGame(address);
        } else if (0xed8faf3d == v0) {
            buildingStorage();
        } else if (0xede8acdb == v0) {
            startAuction(bytes32);
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        } else if (0xf5807181 == v0) {
            getIndexLength(address);
        }
    }
    ();
}
