contract RealmsOfEther {

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
    int256 _x; // STORAGE[0x11]
    int256 _y; // STORAGE[0x12]
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
        // getBuilding(address,bytes32) 9d3bd2e498f6ead5d362d6678757c13559fba40d06da9714eb0087c36562a9c3
        v0, v1, v2, v3, v4, v5 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0x9d3bd2e4, _buildingStorage, _buildingHash).gas(msg.gas - 710); 
        require(v0);
        return MEM[128 + MEM[64]], MEM[96 + MEM[64]], MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
    }

    function 0x1393(bytes32 _troupHash) private { 
        MEM[96 + MEM[64]] = 0;
        require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
        // getCosts(address,bytes32) fc85a0d2e698f56a6fec311b48e42bf692a4a75aededc95723aec8ebdd82bd65
        v0, v1, v2, v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xfc85a0d2, _troupStorage, _troupHash).gas(msg.gas - 710); 
        require(v0);
        return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
    }

    function 0x14f4(bytes32 _buildingHash) private returns (uint256, uint256, uint256) { 
        MEM[96 + MEM[64]] = 0;
        require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
        // getCosts(address,bytes32) fc85a0d2e698f56a6fec311b48e42bf692a4a75aededc95723aec8ebdd82bd65
        v0, v1, v2, v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xfc85a0d2, _buildingStorage, _buildingHash).gas(msg.gas - 710); 
        require(v0);
        return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
    }

    function 0x1749(bytes32 _fortressHash) private returns (uint256, uint256, uint256) { 
    MEM[96 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    // getResources(address,bytes32) 58e9eb78cedc5fb26b0d82bce0a61dda647bb048722bf8108417516a6c9a96ab
    v0, v1, v2, v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x58e9eb78, _fortressStorage, _fortressHash).gas(msg.gas - 710); 
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
    }

    function 0x1a67(bytes32 _buildingHash, bytes32 _fortressHash) private { 
        MEM[64 + MEM[64]] = 0;
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        // getBuilding(address,bytes32,bytes32) 4e49bbe118e01704e0e75511c0d2245ea40edf1366fc6b00fc6e94448682f860
        v0, v1, v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x4e49bbe1, _fortressStorage, _fortressHash, _buildingHash).gas(msg.gas - 710); 
        require(v0);
        return v2, v1;
    }

    function 0x1d04(bytes32 _troupHash, bytes32 _fortressHash) private { 
        MEM[32 + MEM[64]] = 0;
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        // getTroups(address,bytes32,bytes32) fd1fd5ffa3daa90749e9d413b81d2d9c0ac77962670a39cc9a585aaf6db7b76d
        v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xfd1fd5ff, _fortressStorage, _fortressHash, _troupHash).gas(msg.gas - 710); 
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
        // getFortressCount(address) 3f0a6f3da3947528a3c10c7b632aa485fd92b75a9241a1e6caa9b7c6c0d594fa
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
        // createBuilding(address,bytes32,bytes16,uint256,uint256,bytes32,uint256,uint256,uint256,uint256) f481d1257201bef5b23e98f392804b50df6e4de55b4c77983f041001e585b42a
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
        (_wood, _stone, _gold) = 0x1749(_fortressHash);
        v3, v4, v5 = 0x14f4(_buildingHash);
        v6, v7 = 0x1a67(_buildingHash, _fortressHash);
        assert(1 + v7 >= v7);
        v8 = _SafeMul(1 + v7, v5);
        v9 = _SafeMul(1 + v7, v4);
        v10 = _SafeMul(1 + v7, v3);
        v11 = v12 = _gold >= v8;
        if (v12) {
            v11 = v13 = _stone >= v9;
        }
        if (v11) {
            v11 = v14 = _wood >= v10;
        }
        require(v11);
        assert(v8 <= _gold);
        assert(v9 <= _stone);
        assert(v10 <= _wood);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        // build(address,bytes32,bytes32,uint256,uint256,uint256,uint256) 7b2be0037d135e863b94ca0c0b091814c0bda3df2a26ac4b64de888562acd41d
        v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x7b2be003, _fortressStorage, _fortressHash, _buildingHash, _gold - v8, _stone - v9, _wood - v10, 1 + v7).gas(msg.gas - 710);
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
        // getFortressesAvailable(address) 1777d529d64266d7ab95376da04ba76d6e1f8dad5f2408187cc88dec910ceb81
        v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1777d529, _fortressStorage).gas(msg.gas - 710);
        require(v0);
        return v1;
    }

    function getTroupIndexLength() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
        // getIndexLength(address) f5807181d671045f62749f521a02261f0bdaef31382e98a76715da56d0760077
        v0, v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xf5807181, _troupStorage).gas(msg.gas - 710);
        require(v0);
        return v1;
    }

    function createFortress(bytes16 _name) public payable { 
        require(!_paused);
        require(msg.value >= 0x2386f26fc10000);
        fortressHash = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (_name & ~0xffffffffffffffffffffffffffffffff), stor_1);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        // createFortress(address,bytes32,bytes16,int256,int256,uint256,uint256,uint256,uint256,address) bd1fb9816a6d852b8b5f5de67b9d0e92d0d743415a6d654e272efbc04e73d01c
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
        // getHashFromIndex(address,address,uint256) 54c711ba93ff631dcfb2ece9069587ce4365d9d223f7f992ea9dc6291ab68a4e
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
        // getTroup(address,bytes32) 2a33569e4371528147b0997e8c5458c3fb549daf37571af8c6e59218c973b017
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
        // transfer(address,bytes32,address) b844ad67939bc96402f0d90fcf523a1f8e7d4aed6f29e8ef7dda1fc621836c18
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

    function getResources(bytes32 _fortressHash) public view returns (uint256 _gold, uint256 _stone, uint256 _wood) { 
        (_wood, _stone, _gold) = 0x1749(_fortressHash);
        return (_gold, _stone, _wood);
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
        // createTroup(address,bytes32,bytes16,uint256,uint256,uint256,uint256,uint256,uint256,uint256) 93fdc92913a686b38e07c5c4ea05dc67fcb83a5b50bb4adedd428ee11afd2412
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
        // startMinting(address) d87f3856576ab78ef0d0b0d8eab721585def3d6236a52ac6d8e1115fe279665e
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
        // getFortress(address,bytes32) 0d041e57af10e8b618a230f1ce5660f0cd45b82e09c5cc53d85941a950b56f29
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
        // getIndexLength(address) f5807181d671045f62749f521a02261f0bdaef31382e98a76715da56d0760077
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
}