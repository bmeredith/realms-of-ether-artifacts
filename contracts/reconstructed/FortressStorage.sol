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
    uint256 public genesisTime; // STORAGE[0x1]
    uint256 stor_2; // STORAGE[0x2] 0x5d694a72
    mapping(address => bytes32[]) public ownerFortresses; // STORAGE[0x3]
    mapping(address => uint256) public ownerFortressesLength; // STORAGE[0x4]
    mapping(address => uint256) public ownerFortressesCount; // STORAGE[0x5]
    mapping(bytes32 => uint256) public fortressOwnerIndex; // STORAGE[0x6]
    bytes32[] fortressHashes; // STORAGE[0x7]
    mapping(bytes32 => bool) exists; // STORAGE[0x8]
    mapping(bytes32 => bytes16) names; // STORAGE[0x9]
    mapping(bytes32 => address) fortressOwner; // STORAGE[0xa]
    mapping(bytes32 => int256) x; // STORAGE[0xb]
    mapping(bytes32 => int256) y; // STORAGE[0xc]
    mapping(bytes32 => uint256) gold; // STORAGE[0xd]
    mapping(bytes32 => uint256) wood; // STORAGE[0xe]
    mapping(bytes32 => uint256) stone; // STORAGE[0xf]
    mapping(bytes32 => uint256) troups; // STORAGE[0x10]
    // STORAGE[0x11] - unknown, may be unused or unreferenced
    mapping(bytes32 => uint256) buildingLevel; // STORAGE[0x12]
    mapping(bytes32 => uint256) buildingTimeout; // STORAGE[0x13]

    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function FortressStorage() public {
        owner = msg.sender;
        stor_2 = 1000;
    }

    function unknown_0x11f9() 
        private 
    { 
        uint256 fortressesRemaining = _fortressesRemaining();
        v1 = _SafeSub(fortressHashes.length, fortressesRemaining);
        return v1;
    }

    function getFortressCount() 
        public 
        returns (uint256)
    { 
        return fortressHashes.length;
    }

    function totalSupply() 
        public 
        returns (uint256)
    { 
        v0 = unknown_0xbc1();
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
        troups[_fortressHash] = _wins;
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
        return buildingLevel[keccak256(_fortressHash, _buildingHash)];
    }

    function createFortress(
        bytes32 _fortressHash, 
        address _user
    ) 
        public 
    { 
        require(msg.sender == owner);
        v0 = unknown_0x11f9();
        require(v0 > fortressHashes.length);
        require(!exists[_fortressHash]);
        fortressHashes.length += 1;
        if (!fortressHashes.length <= 1 + fortressHashes.length) {
            v1 = v2 = keccak256(7) + (1 + fortressHashes.length);
            while (keccak256(7) + fortressHashes.length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        fortressHashes[fortressHashes.length] = _fortressHash;
        exists[_fortressHash] = 1;
        fortressOwner[_fortressHash] = _user;
        ownerFortresses[_user].length += 1;
        if (!ownerFortresses[_user].length <= 1 + ownerFortresses[_user].length) {
            v3 = v4 = keccak256(keccak256(_user, 3)) + (1 + ownerFortresses[_user].length);
            while (keccak256(keccak256(_user, 3)) + ownerFortresses[_user].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        ownerFortresses[_user][ownerFortresses[_user].length] = _fortressHash;
        fortressOwnerIndex[_fortressHash] = ownerFortressesLength[_user];
        v5 = _SafeAdd(1, ownerFortressesLength[_user]);
        ownerFortressesLength[_user] = v5;
        v6 = _SafeAdd(1, ownerFortressesCount[_user]);
        ownerFortressesCount[_user] = v6;
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
        troups[keccak256(_fortressHash, _troupHash)] = _amount;
    }

    function getFortressesAvailable()
        public 
        returns (uint256)
    { 
        v0 = unknown_0x11f9();
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
        assert(fortressOwnerIndex[_fortressHash] < ownerFortresses[fortressOwner[_fortressHash]].length);
        ownerFortresses[fortressOwner[_fortressHash]][fortressOwnerIndex[_fortressHash]] = uint256(0);
        v0 = _SafeSub(1, ownerFortressesCount[fortressOwner[_fortressHash]]);
        ownerFortressesCount[fortressOwner[_fortressHash]] = v0;
        fortressOwner[_fortressHash] = _newOwner;
        ownerFortresses[_newOwner].length += 1;
        if (!ownerFortresses[_newOwner].length <= 1 + ownerFortresses[_newOwner].length) {
            v1 = v2 = keccak256(keccak256(_newOwner, 3)) + (1 + ownerFortresses[_newOwner].length);
            while (keccak256(keccak256(_newOwner, 3)) + ownerFortresses[_newOwner].length > v1) {
                STORAGE[v1] = 0;
                v1 += 1;
            }
        }
        ownerFortresses[_newOwner][ownerFortresses[_newOwner].length] = _fortressHash;
        fortressOwnerIndex[_fortressHash] = ownerFortressesLength[_newOwner];
        v3 = _SafeAdd(1, ownerFortressesLength[_newOwner]);
        ownerFortressesLength[_newOwner] = v3;
        v4 = _SafeAdd(1, ownerFortressesCount[_newOwner]);
        ownerFortressesCount[_newOwner] = v4;
    }

    function 0x5d694a72() 
        public 
        returns (uint256)
    { 
        return stor_2;
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
        return troups[keccak256(_fortressHash, _troupHash)];
    }

    function setStone(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        stone[_fortressHash] = _amount;
    }

    function setGold(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        gold[_fortressHash] = _amount;
    }

    function getHashFromIndex(
        address _user, 
        uint256 _index
    ) 
        public 
        returns (bytes32)
    { 
        assert(_index < ownerFortresses[_user].length);
        return ownerFortresses[_user][_index];
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
        buildingLevel[keccak256(_fortressHash, _buildingHash)] = _level;
    }

    function startMinting() 
        public 
    { 
        require(msg.sender == owner);
        require(genesisTime == 0);
        genesisTime = block.timestamp;
    }

    function setWood(
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_fortressHash]);
        wood[_fortressHash] = _amount;
    }

    function getBuildingTimeout(
        bytes32 _fortressHash, 
        bytes32 _buildingHash
    )
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return buildingTimeout[keccak256(_fortressHash, _buildingHash)];
    }

    function getWins(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return troups[_fortressHash];
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
        buildingTimeout[keccak256(_fortressHash, _buildingHash)] = _timeout;
    }

    function getX(bytes32 _fortressHash) 
        public 
        returns (int256)
    { 
        require(exists[_fortressHash]);
        return x[_fortressHash];
    }

    function fortressExists(bytes32 _fortressHash) 
        public 
        returns (bool)
    { 
        return exists[_fortressHash];
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
        return wood[_fortressHash];
    }

    function getStone(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return stone[_fortressHash];
    }

    function getGold(bytes32 _fortressHash) 
        public 
        returns (uint256)
    { 
        require(exists[_fortressHash]);
        return gold[_fortressHash];
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
        return ownerFortressesLength[_user];
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

    function _fortressesRemaining() 
        private 
        returns (uint256)
    { 
        if (genesisTime != 0) {
            assert(bool(900));
            v0 = _SafeAdd((block.timestamp - genesisTime) / 900, stor_2);
            return v0;
        } else {
            return stor_2;
        }
    }

    function() public payable {
        revert();
    }
}