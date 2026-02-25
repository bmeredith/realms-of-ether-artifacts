pragma solidity 0.4.18;

/// @title BuildingStorage for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Persistent on-chain storage contract for Buildings in Realms of Ether.
/// Stores stats (costs, recruitments, etc.) and their resources (gold, wood, stone)
/// for each building, keyed by a bytes32 hash identifier.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.
contract BuildingStorage {
    address public owner;
    uint256[] _getIndexLength; // STORAGE[0x1]
    mapping(bytes32 => bool) exists; // STORAGE[0x2]
    mapping(bytes32 => uint256) mapping_3; // STORAGE[0x3]
    mapping(bytes32 => uint256) mapping_4; // STORAGE[0x4]
    mapping(bytes32 => uint256) mapping_5; // STORAGE[0x5]
    mapping(bytes32 => uint256) mapping_6; // STORAGE[0x6]
    mapping(bytes32 => uint256) mapping_7; // STORAGE[0x7]
    mapping(bytes32 => uint256) gold; // STORAGE[0x8] mapping_8
    mapping(bytes32 => uint256) wood; // STORAGE[0x9] mapping_9
    mapping(bytes32 => uint256) stone; // STORAGE[0xa] mapping_a

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

    function 0x21d26a38(bytes32 _buildingHash) 
        public 
    { 
        require(msg.sender == owner);
        require(bool(!exists[_buildingHash]));
        _getIndexLength.length += 1;
        if (!_getIndexLength.length <= 1 + _getIndexLength.length) {
            v0 = v1 = keccak256(1) + (1 + _getIndexLength.length);
            while (keccak256(1) + _getIndexLength.length > v0) {
                STORAGE[v0] = 0;
                v0 += 1;
            }
        }
        _getIndexLength[_getIndexLength.length] = _buildingHash;
        exists[_buildingHash] = 1;
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
    { 
        require(exists[uint256(_buildingHash)]);
        return bytes16(mapping_3[uint256(_buildingHash)] << 128);
    }

    function getHash(uint256 _nonce) 
        public 
    { 
        assert(_nonce < _getIndexLength.length);
        return uint256(_getIndexLength[_nonce]);
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
        return _getIndexLength.length;
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

    function 0xf776c071(bytes32 _buildingHash, bytes16 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(exists[_buildingHash]);
        mapping_3[_buildingHash] = varg1 >> 128 | bytes16(mapping_3[_buildingHash]);
    }

    function 0xfe6f1143(bytes32 _buildingHash) 
        public 
    { 
        require(exists[_buildingHash]);
        return uint256(mapping_6[_buildingHash]);
    }
}
