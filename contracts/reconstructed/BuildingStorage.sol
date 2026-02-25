pragma solidity 0.4.18;

/// @title BuildingStorage for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Persistent on-chain storage contract for Buildings in Realms of Ether.
/// Stores attributes (costs, recruitments, etc.) and their resources (gold, wood, stone)
/// for each building, keyed by a bytes32 hash identifier.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.
contract BuildingStorage {
    address public owner;
    bytes32[] internal buildingHashes; // STORAGE[0x1]
    
    // tracks whether a given hash has been registered via createBuilding()
    mapping(bytes32 => bool) internal exists; // STORAGE[0x2]
    mapping(bytes32 => uint256) internal names; // STORAGE[0x3]

    mapping(bytes32 => uint256) internal mapping_4; // STORAGE[0x4]
    mapping(bytes32 => uint256) internal mapping_5; // STORAGE[0x5]
    mapping(bytes32 => uint256) internal mapping_6; // STORAGE[0x6]
    mapping(bytes32 => uint256) internal mapping_7; // STORAGE[0x7]
    
    // resources
    mapping(bytes32 => uint256) internal gold; // STORAGE[0x8] mapping_8
    mapping(bytes32 => uint256) internal wood; // STORAGE[0x9] mapping_9
    mapping(bytes32 => uint256) internal stone; // STORAGE[0xa] mapping_a

    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function BuildingStorage() public {
        owner = msg.sender;
    }

    function() public payable { 
        revert();
    }

    function 0x08f822a5(bytes32 _buildingHash)
        public 
    { 
        require(exists[_buildingHash]);
        return mapping_7[_buildingHash];
    }

    function createBuilding(bytes32 _buildingHash) 
        public 
    { 
        require(msg.sender == owner);
        require(!exists[_buildingHash]);
        
        buildingHashes.push(_buildingHash);
        exists[_buildingHash] = true;
    }

    function 0x2c5e9b09(bytes32 _buildingHash, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        mapping_6[_buildingHash] = varg1;
    }

    function 0x394c1f42(bytes32 _buildingHash, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        mapping_5[_buildingHash] = varg1;
    }

    function 0x4610af12(bytes32 _buildingHash, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        mapping_4[_buildingHash] = varg1;
    }

    function 0x50fdbd81(bytes32 _buildingHash) 
        public 
    { 
        require(exists[_buildingHash]);
        return mapping_5[varg0];
    }

    function getName(bytes32 _buildingHash) 
        public 
        returns (bytes16)
    { 
        require(exists[_buildingHash]);
        return names[_buildingHash];
    }

    function getHash(uint256 _nonce) 
        public 
        returns (bytes32)
    { 
        return buildingHashes[_nonce];
    }

    function setStone(bytes32 _buildingHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        stone[_buildingHash] = _amount;
    }

    function setGold(bytes32 _buildingHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        gold[_buildingHash] = _amount;
    }

    function 0x8d4fd8c1(bytes32 _buildingHash, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        mapping_7[_buildingHash] = varg1;
    }

    function setWood(bytes32 _buildingHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        wood[_buildingHash] = _amount;
    }

    function 0xdce9f070(bytes32 _buildingHash) 
        public 
    { 
        require(exists[_buildingHash]);
        return mapping_4[_buildingHash];
    }

    function getWood(bytes32 _buildingHash) 
        public 
        returns (uint256)
    { 
        require(exists[_buildingHash]);
        return wood[_buildingHash];
    }

    function getIndexLength() 
        public 
        returns (uint256)
    { 
        return buildingHashes.length;
    }

    function getStone(bytes32 _buildingHash) 
        public 
        returns (uint256)
    { 
        require(exists[_buildingHash]);
        return stone[_buildingHash];
    }

    function getGold(bytes32 _buildingHash) 
        public
        returns (uint256)
    { 
        require(exists[_buildingHash]);
        return gold[_buildingHash];
    }

    function transferOwnership(address newOwner) 
        public 
    { 
        require(msg.sender == owner);
        require(bool(newOwner != address(0x0)));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function setname(bytes32 _buildingHash, bytes16 _name) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);

        names[_buildingHash] = _name;
    }

    function 0xfe6f1143(bytes32 _buildingHash) 
        public 
    { 
        require(exists[_buildingHash]);
        return uint256(mapping_6[_buildingHash]);
    }
}
