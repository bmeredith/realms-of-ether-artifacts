pragma solidity 0.4.18;

/// @title FortressStorage for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Persistent on-chain storage contract for Fortresses in Realms of Ether.
/// Stores their resources (gold, wood, stone), building attributes (level, timeout),   
/// and attributes for each fortress, keyed by a bytes32 hash identifier.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.
contract FortressStorage {
    uint256 _genesisTime; // STORAGE[0x1]
    uint256 stor_2; // STORAGE[0x2]
    mapping (address => uint256[]) mapping_3; // STORAGE[0x3]
    mapping (address => uint256) mapping_4; // STORAGE[0x4]
    mapping (address => uint256) _balanceOf; // STORAGE[0x5]
    mapping (uint256 => uint256) mapping_6; // STORAGE[0x6]
    uint256[] array_7; // STORAGE[0x7]
    mapping (uint256 => bool) _getName; // STORAGE[0x8]
    mapping (uint256 => uint256) mapping_9; // STORAGE[0x9]
    mapping (uint256 => address) _getOwner; // STORAGE[0xa]
    mapping (uint256 => uint256) mapping_b; // STORAGE[0xb]
    mapping (uint256 => uint256) mapping_c; // STORAGE[0xc]
    mapping (uint256 => uint256) mapping_d; // STORAGE[0xd]
    mapping (uint256 => uint256) mapping_e; // STORAGE[0xe]
    mapping (uint256 => uint256) mapping_f; // STORAGE[0xf]
    mapping (uint256 => uint256) mapping_10; // STORAGE[0x10]
    mapping (uint256 => uint256) mapping_12; // STORAGE[0x12]
    mapping (uint256 => uint256) mapping_13; // STORAGE[0x13]
    address _owner; // STORAGE[0x0] bytes 0 to 19

    // Events
    OwnershipTransferred(address, address);

    function 0x11f9() 
        private 
    { 
        v0 = 0xbc1();
        v1 = _SafeSub(array_7.length, v0);
        return v1;
    }

    function getFortressCount() 
        public 
    { 
        return array_7.length;
    }

    function totalSupply() 
        public 
    { 
        v0 = 0xbc1();
        return v0;
    }

    function setWins(
        bytes32 varg0, 
        uint256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_10[varg0] = varg1;
    }

    function _SafeAdd(
        uint256 varg0, 
        uint256 varg1
    ) 
        private 
    { 
        v0 = varg1 + varg0 >= varg1;
        assert(bool(v0));
        return varg1 + varg0;
    }

    function _SafeSub(
        uint256 varg0, 
        uint256 varg1
    ) 
        private 
    { 
        assert(varg0 <= varg1);
        return varg1 - varg0;
    }

    function getY(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_c[varg0];
    }

    function getBuildingLevel(
        bytes32 varg0, 
        bytes32 varg1
    ) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_12[uint256(keccak256(varg0, varg1))];
    }

    function genesisTime() public { 
        return _genesisTime;
    }

    function createFortress(
        bytes32 varg0, 
        address varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        v0 = 0x11f9();
        require(v0 > array_7.length);
        require(bool(!_getName[varg0]));
        array_7.length += 1;
        if (!array_7.length <= 1 + array_7.length) {
            v1 = v2 = keccak256(7) + (1 + array_7.length);
            while (keccak256(7) + array_7.length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        array_7[array_7.length] = varg0;
        _getName[varg0] = 1;
        _getOwner[varg0] = varg1;
        mapping_3[varg1].length += 1;
        if (!mapping_3[varg1].length <= 1 + mapping_3[varg1].length) {
            v3 = v4 = keccak256(keccak256(varg1, 3)) + (1 + mapping_3[varg1].length);
            while (keccak256(keccak256(varg1, 3)) + mapping_3[varg1].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        mapping_3[varg1][mapping_3[varg1].length] = varg0;
        mapping_6[varg0] = mapping_4[varg1];
        v5 = _SafeAdd(1, mapping_4[varg1]);
        mapping_4[varg1] = v5;
        v6 = _SafeAdd(1, _balanceOf[varg1]);
        _balanceOf[varg1] = v6;
    }

    function setTroups(
        bytes32 varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_10[uint256(keccak256(varg0, varg1))] = varg2;
    }

    function getFortressesAvailable()
        public 
    { 
        v0 = 0x11f9();
        return v0;
    }

    function getName(bytes32 saleId) 
        public 
    { 
        require(_getName[uint256(saleId)]);
        return bytes16(mapping_9[uint256(saleId)] << 128);
    }

    function setOwner(
        bytes32 node, 
        address owner
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[uint256(node)]);
        assert(mapping_6[uint256(node)] < mapping_3[_getOwner[uint256(node)]].length);
        mapping_3[_getOwner[uint256(node)]][mapping_6[uint256(node)]] = uint256(0);
        v0 = _SafeSub(1, _balanceOf[_getOwner[uint256(node)]]);
        _balanceOf[_getOwner[uint256(node)]] = v0;
        _getOwner[uint256(node)] = owner;
        mapping_3[owner].length += 1;
        if (!mapping_3[owner].length <= 1 + mapping_3[owner].length) {
            v1 = v2 = keccak256(keccak256(owner, 3)) + (1 + mapping_3[owner].length);
            while (keccak256(keccak256(owner, 3)) + mapping_3[owner].length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        mapping_3[owner][mapping_3[owner].length] = uint256(node);
        mapping_6[uint256(node)] = mapping_4[owner];
        v3 = _SafeAdd(1, mapping_4[owner]);
        mapping_4[owner] = v3;
        v4 = _SafeAdd(1, _balanceOf[owner]);
        _balanceOf[owner] = v4;
    }

    function 0x5d694a72() 
        public 
    { 
        return stor_2;
    }

    function 0x66a7045c(uint256 varg0) 
        public 
    { 
        assert(varg0 < array_7.length);
        return uint256(array_7[varg0]);
    }

    function setX(
        bytes32 varg0, 
        int256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_b[varg0] = varg1;
    }

    function getTroups(
        bytes32 varg0, 
        bytes32 varg1
    ) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_10[uint256(keccak256(varg0, varg1))];
    }

    function setStone(
        bytes32 varg0, 
        uint256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_f[varg0] = varg1;
    }

    function balanceOf(address account) 
        public 
    { 
        return _balanceOf[account];
    }

    function setGold(
        bytes32 varg0, 
        uint256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_d[varg0] = varg1;
    }

    function 0x7679bede(uint256 varg0) 
        public 
    { 
        return mapping_6[varg0];
    }

    function getHashFromIndex(
        address varg0, 
        uint256 varg1
    ) 
        public 
    { 
        assert(varg1 < mapping_3[varg0].length);
        return uint256(mapping_3[varg0][varg1]);
    }

    function 0x7ce3705e(address varg0) 
        public 
    { 
        return _balanceOf[varg0];
    }

    function owner() 
        public 
    { 
        return _owner;
    }

    function setBuildingLevel(
        bytes32 varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_12[uint256(keccak256(varg0, varg1))] = varg2;
    }

    function startMinting() 
        public 
    { 
        require(msg.sender == _owner);
        require(_genesisTime == 0);
        _genesisTime = block.timestamp;
    }

    function setWood(
        bytes32 varg0, 
        uint256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_e[varg0] = varg1;
    }

    function 0xab756f29(address varg0) 
        public 
    { 
        return mapping_4[varg0];
    }

    function getBuildingTimeout(
        bytes32 varg0, 
        bytes32 varg1
    )
        public 
    { 
        require(_getName[varg0]);
        return mapping_13[uint256(keccak256(varg0, varg1))];
    }

    function getWins(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_10[varg0];
    }

    function setY(
        bytes32 varg0, 
        int256 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_c[varg0] = varg1;
    }

    function setBuildingTimeout(
        bytes32 varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_13[uint256(keccak256(varg0, varg1))] = varg2;
    }

    function 0xc2fe3942(
        address varg0, 
        uint256 varg1
    ) 
        public 
    { 
        assert(varg1 < mapping_3[varg0].length);
        return uint256(mapping_3[varg0][varg1]);
    }

    function getX(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_b[varg0];
    }

    function 0xcf2dd7d1(uint256 varg0) 
        public 
    { 
        return _getName[varg0];
    }

    function getOwner(bytes32 _domainHash) 
        public 
    { 
        require(_getName[uint256(_domainHash)]);
        return _getOwner[uint256(_domainHash)];
    }

    function getWood(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_e[varg0];
    }

    function getStone(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_f[varg0];
    }

    function getGold(bytes32 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_d[varg0];
    }

    function transferOwnership(address newOwner) 
        public 
    { 
        require(msg.sender == _owner);
        require(bool(newOwner != address(0x0)));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function getIndexLength(address varg0) 
        public 
    { 
        return mapping_4[varg0];
    }

    function setName(
        bytes32 varg0, 
        bytes16 varg1
    ) 
        public 
    { 
        require(msg.sender == _owner);
        require(_getName[varg0]);
        mapping_9[varg0] = varg1 >> 128 | bytes16(mapping_9[varg0]);
    }

    function 0xbc1() 
        private 
    { 
        if (_genesisTime != 0) {
            assert(bool(900));
            v0 = _SafeAdd((block.timestamp - _genesisTime) / 900, stor_2);
            return v0;
        } else {
            return stor_2;
        }
    }

    function() public payable {
        revert();
    }
}