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
    mapping (uint256 => bool) _getName; // STORAGE[0x2]
    mapping (uint256 => uint256) mapping_3; // STORAGE[0x3]
    mapping (uint256 => uint256) mapping_4; // STORAGE[0x4]
    mapping (uint256 => uint256) mapping_5; // STORAGE[0x5]
    mapping (uint256 => uint256) mapping_6; // STORAGE[0x6]
    mapping (uint256 => uint256) mapping_7; // STORAGE[0x7]
    mapping (bytes32 => uint256) gold; // STORAGE[0x8] mapping_8
    mapping (bytes32 => uint256) wood; // STORAGE[0x9] mapping_9
    mapping (bytes32 => uint256) stone; // STORAGE[0xa] mapping_a

    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function BuildingStorage() public {
        owner = msg.sender;
    }

    function() public payable { 
        revert();
    }

    function 0x08f822a5(uint256 varg0)
     public 
    { 
        require(_getName[varg0]);
        return mapping_7[varg0];
    }

    function 0x21d26a38(uint256 varg0) 
        public 
    { 
        require(msg.sender == owner);
        require(bool(!_getName[varg0]));
        _getIndexLength.length += 1;
        if (!_getIndexLength.length <= 1 + _getIndexLength.length) {
            v0 = v1 = keccak256(1) + (1 + _getIndexLength.length);
            while (keccak256(1) + _getIndexLength.length > v0) {
                STORAGE[v0] = 0;
                v0 += 1;
            }
        }
        _getIndexLength[_getIndexLength.length] = varg0;
        _getName[varg0] = 1;
    }

    function 0x2c5e9b09(uint256 varg0, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[varg0]);
        mapping_6[varg0] = varg1;
    }

    function 0x394c1f42(uint256 varg0, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[varg0]);
        mapping_5[varg0] = varg1;
    }

    function 0x4610af12(uint256 varg0, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[varg0]);
        mapping_4[varg0] = varg1;
    }

    function 0x50fdbd81(uint256 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_5[varg0];
    }

    function getName(bytes32 saleId) 
        public 
    { 
        require(_getName[uint256(saleId)]);
        return bytes16(mapping_3[uint256(saleId)] << 128);
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
        require(_getName[_buildingHash]);
        stone[_buildingHash] = _amount;
    }

    function setGold(bytes32 _buildingHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[_buildingHash]);
        gold[_buildingHash] = _amount;
    }

    function 0x8d4fd8c1(uint256 varg0, uint256 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[varg0]);
        mapping_7[varg0] = varg1;
    }

    function setWood(bytes32 _buildingHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[_buildingHash]);
        wood[_buildingHash] = _amount;
    }

    function 0xdce9f070(uint256 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return mapping_4[varg0];
    }

    function getWood(bytes32 _buildingHash) 
        public 
        returns (uint256)
    { 
        require(_getName[_buildingHash]);
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
        require(_getName[_buildingHash]);
        return stone[_buildingHash];
    }

    function getGold(bytes32 _buildingHash) 
        public
        returns (uint256)
    { 
        require(_getName[_buildingHash]);
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

    function 0xf776c071(uint256 varg0, bytes16 varg1) 
        public 
    { 
        require(msg.sender == owner);
        require(_getName[varg0]);
        mapping_3[varg0] = varg1 >> 128 | bytes16(mapping_3[varg0]);
    }

    function 0xfe6f1143(uint256 varg0) 
        public 
    { 
        require(_getName[varg0]);
        return uint256(mapping_6[varg0]);
    }
}
