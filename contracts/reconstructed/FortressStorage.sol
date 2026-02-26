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
    address public owner; // STORAGE[0x0] bytes 0 to 19
    uint256 _genesisTime; // STORAGE[0x1]
    uint256 stor_2; // STORAGE[0x2]
    mapping(address => uint256[]) mapping_3; // STORAGE[0x3]
    mapping(address => bytes32) mapping_4; // STORAGE[0x4]
    mapping(address => uint256) _balanceOf; // STORAGE[0x5]
    mapping(uint256 => uint256) mapping_6; // STORAGE[0x6]
    uint256[] array_7; // STORAGE[0x7]
    mapping(bytes32 => bool) exists; // STORAGE[0x8]
    mapping(bytes32 => bytes16) names; // STORAGE[0x9]
    mapping(bytes32 => address) fortressOwner; // STORAGE[0xa]
    mapping(bytes32 => int256) x; // STORAGE[0xb]
    mapping(bytes32 => int256) y; // STORAGE[0xc]
    mapping(uint256 => uint256) mapping_d; // STORAGE[0xd]
    mapping(uint256 => uint256) mapping_e; // STORAGE[0xe]
    mapping(uint256 => uint256) mapping_f; // STORAGE[0xf]
    mapping(bytes32 => uint256) mapping_10; // STORAGE[0x10]
    mapping(bytes32 => uint256) mapping_12; // STORAGE[0x12]
    mapping(uint256 => uint256) mapping_13; // STORAGE[0x13]

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
        returns (uint256)
    { 
        return array_7.length;
    }

    function totalSupply() 
        public 
        returns (uint256)
    { 
        v0 = 0xbc1();
        return v0;
    }

    function setWins(
        bytes32 _fortressHash, 
        uint256 _wins
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_10[_fortressHash] = _wins;
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

    function getY(bytes32 _fortressHash) 
        public 
        returns (int256)
    { 
        require(exists[_fortressHash]);
        return y[_fortressHash];
    }

    function getBuildingLevel(
        bytes32 _fortressHash, 
        bytes32 _buildingHash
    ) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_12[keccak256(_fortressHash, _buildingHash)];
    }

    function genesisTime() public { 
        return _genesisTime;
    }

    function createFortress(
        bytes32 _fortressHash, 
        address _user
    ) 
        public 
    { 
        require(msg.sender == owner);
        v0 = 0x11f9();
        require(v0 > array_7.length);
        require(!exists[_fortressHash]);
        array_7.length += 1;
        if (!array_7.length <= 1 + array_7.length) {
            v1 = v2 = keccak256(7) + (1 + array_7.length);
            while (keccak256(7) + array_7.length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        array_7[array_7.length] = _fortressHash;
        exists[_fortressHash] = 1;
        fortressOwner[_fortressHash] = _user;
        mapping_3[_user].length += 1;
        if (!mapping_3[_user].length <= 1 + mapping_3[_user].length) {
            v3 = v4 = keccak256(keccak256(_user, 3)) + (1 + mapping_3[_user].length);
            while (keccak256(keccak256(_user, 3)) + mapping_3[_user].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        mapping_3[_user][mapping_3[_user].length] = _fortressHash;
        mapping_6[_fortressHash] = mapping_4[_user];
        v5 = _SafeAdd(1, mapping_4[_user]);
        mapping_4[_user] = v5;
        v6 = _SafeAdd(1, _balanceOf[_user]);
        _balanceOf[_user] = v6;
    }

    function setTroups(
        bytes32 _fortressHash, 
        bytes32 _troupHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_10[keccak256(_fortressHash, _troupHash)] = _amount;
    }

    function getFortressesAvailable()
        public 
        returns (uint256)
    { 
        v0 = 0x11f9();
        return v0;
    }

    function getName(bytes32 _fortressHash) 
        public 
        returns (bytes16)
    { 
        require(exists[_fortressHash]);
        return names[_fortressHash];
    }

    function setOwner(
        bytes32 _fortressHash, 
        address _newOwner
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        assert(mapping_6[_fortressHash] < mapping_3[fortressOwner[_fortressHash]].length);
        mapping_3[fortressOwner[_fortressHash]][mapping_6[_fortressHash]] = uint256(0);
        v0 = _SafeSub(1, _balanceOf[fortressOwner[_fortressHash]]);
        _balanceOf[fortressOwner[_fortressHash]] = v0;
        fortressOwner[_fortressHash] = _newOwner;
        mapping_3[_newOwner].length += 1;
        if (!mapping_3[_newOwner].length <= 1 + mapping_3[_newOwner].length) {
            v1 = v2 = keccak256(keccak256(_newOwner, 3)) + (1 + mapping_3[_newOwner].length);
            while (keccak256(keccak256(_newOwner, 3)) + mapping_3[_newOwner].length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        mapping_3[_newOwner][mapping_3[_newOwner].length] = _fortressHash;
        mapping_6[_fortressHash] = mapping_4[_newOwner];
        v3 = _SafeAdd(1, mapping_4[_newOwner]);
        mapping_4[_newOwner] = v3;
        v4 = _SafeAdd(1, _balanceOf[_newOwner]);
        _balanceOf[_newOwner] = v4;
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
        bytes32 _fortressHash, 
        int256 _x
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        x[_fortressHash] = _x;
    }

    function getTroups(
        bytes32 _fortressHash, 
        bytes32 _troupHash
    ) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_10[keccak256(_fortressHash, _troupHash)];
    }

    function setStone(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_f[_fortressHash] = _amount;
    }

    function balanceOf(address account) 
        public 
    { 
        return _balanceOf[account];
    }

    function setGold(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_d[_fortressHash] = _amount;
    }

    function 0x7679bede(uint256 varg0) 
        public 
    { 
        return mapping_6[varg0];
    }

    function getHashFromIndex(
        address _user, 
        uint256 _index
    ) 
        public 
        returns (bytes32)
    { 
        assert(_index < mapping_3[_user].length);
        return uint256(mapping_3[_user][_index]);
    }

    function 0x7ce3705e(address varg0) 
        public 
    { 
        return _balanceOf[varg0];
    }

    function setBuildingLevel(
        bytes32 _fortressHash, 
        bytes32 _buildingHash, 
        uint256 _level
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_12[keccak256(_fortressHash, _buildingHash)] = _level;
    }

    function startMinting() 
        public 
    { 
        require(msg.sender == owner);
        require(_genesisTime == 0);
        _genesisTime = block.timestamp;
    }

    function setWood(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_e[_fortressHash] = _amount;
    }

    function 0xab756f29(address varg0) 
        public 
    { 
        return mapping_4[varg0];
    }

    function getBuildingTimeout(
        bytes32 _fortressHash, 
        bytes32 _buildingHash
    )
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_13[uint256(keccak256(_fortressHash, _buildingHash))];
    }

    function getWins(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_10[_fortressHash];
    }

    function setY(
        bytes32 _fortressHash, 
        int256 _y
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        y[_fortressHash] = _y;
    }

    function setBuildingTimeout(
        bytes32 _fortressHash, 
        bytes32 _buildingHash, 
        uint256 _timeout
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        mapping_13[keccak256(_fortressHash, _timeout)] = _timeout;
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

    function getX(bytes32 _fortressHash) 
        public 
        returns (int256)
    { 
        require(exists[_fortressHash]);
        return x[_fortressHash];
    }

    function 0xcf2dd7d1(uint256 varg0) 
        public 
    { 
        return exists[varg0];
    }

    function getOwner(bytes32 _fortressHash) 
        public 
        returns (address)
    { 
        require(exists[_fortressHash]);
        return fortressOwner[_fortressHash];
    }

    function getWood(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_e[_fortressHash];
    }

    function getStone(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_f[_fortressHash];
    }

    function getGold(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return mapping_d[_fortressHash];
    }

    function transferOwnership(address newOwner) 
        public 
    { 
        require(msg.sender == owner);
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function getIndexLength(address _user) 
        public 
        returns (uint256)
    { 
        return mapping_4[_user];
    }

    function setName(
        bytes32 _fortressHash, 
        bytes16 _name
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        
        names[_fortressHash] = _name;
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