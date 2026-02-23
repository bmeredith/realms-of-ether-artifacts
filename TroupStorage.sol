pragma solidity 0.4.19;

contract TroupStorage {
    address _owner; // STORAGE[0x0] bytes 0 to 19
    uint256 [] troupHashes; // STORAGE[0x1] _getIndexLength
    mapping (uint256  => bool) exists; // STORAGE[0x2] _getName
    mapping (uint256  => uint256) packedNames; // STORAGE[0x3] mapping_3
    mapping (uint256  => uint256) life; // STORAGE[0x4] mapping_4
    mapping (uint256  => uint256) strength; // STORAGE[0x5] mapping_5
    mapping (uint256  => uint256) intelligence; // STORAGE[0x6] mapping_6
    mapping (uint256  => uint256) dexterity; // STORAGE[0x7] mapping_7
    mapping (uint256  => uint256) gold; // STORAGE[0x8] mapping_8
    mapping (uint256  => uint256) wood; // STORAGE[0x9] mapping_9
    mapping (uint256  => uint256) stone; // STORAGE[0xa] mapping_a
    
    // Events
    event OwnershipTransferred(address, address);

    function TroupStorage() public {
        _owner = msg.sender;
    }

    function() public payable {
        revert();
    }

    // 0x080461f9
    function setStrength(bytes32 _troupHash, uint256 _amount) 
        public
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        strength[k] = _amount;
    }

    // 0x41731f8b
    function setIntelligence(bytes32 _troupHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        intelligence[k] = _amount;
    }

    // 0x54b8d5e3
    function getName(bytes32 _troupHash) 
        public
        returns (bytes16)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return bytes16(packedNames[k] << 128);
    }

    // 0x6453da9a
    function getStrength(bytes32 _troupHash) 
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return strength[k];
    }

    // 0x6b2fafa9
    function getHash(uint256 _nonce) 
        public 
        returns (uint256)
    { 
        assert(_nonce < troupHashes.length);
        return troupHashes[_nonce];
    }

    // 0x6d0af38e
    function setStone(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        stone[k] = _amount;
    }

    // 0x70c92125
    function setGold(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        gold[k] = _amount;
    }

    // 0x718de536
    function setDexterity(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        dexterity[k] = _amount;
    }

    // 0x79525281
    function getIntelligence(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return intelligence[k];
    }

    // 0x7a65efc9
    function createTroup(bytes32 _troupHash)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(!exists[k]);

        uint256 i = troupHashes.length;
        troupHashes.length = i + 1;
        troupHashes[i] = k;

        exists[k] = true;
    }

    // 0x82f0b31c
    function getLife(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return life[k];
    }

    function owner() public returns (address) {
        return _owner;
    }

    // 0x9342ccc2
    function getDexterity(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return dexterity[k];
    }

    // 0x9c8b8588
    function setWood(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        wood[k] = _amount;
    }

    // 0xc74d8903
    function setLife(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        life[k] = _amount;
    }

    // 0xe0d87dc2
    function getWood(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return wood[k];
    }

    // 0xe1ba7d01
    function getIndexLength()
        public
        returns (uint256)
    { 
        return troupHashes.length;
    }

    // 0xe382af35
    function getStone(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return stone[k];
    }

    // 0xe75f7871
    function getGold(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 k = uint256(_troupHash);
        require(exists[k]);
        return gold[k];
    }

    function transferOwnership(address newOwner) public { 
        require(msg.sender == _owner);
        require(bool(newOwner != address(0x0)));
        OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    // 0xf776c071
    function setName(bytes32 _troupHash, bytes16 _name)
        public 
    { 
        require(msg.sender == _owner);
        uint256 k = uint256(_troupHash);
        require(exists[k]);

        packedNames[k] = (uint256(_name) >> 128) | uint256(bytes16(packedNames[k]));
    }
}