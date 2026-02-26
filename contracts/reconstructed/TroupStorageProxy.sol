pragma solidity 0.4.18;

contract TroupStorageProxy {
    function createTroup(
        address _troupStorage, 
        bytes32 _troupHash, 
        bytes16 _name, 
        uint256 _life, 
        uint256 _strength, 
        uint256 _intelligence, 
        uint256 _dexterity, 
        uint256 _gold, 
        uint256 _wood, 
        uint256 _stone
    ) 
        public 
    { 
        require(bool(troupStorage.code.size));
        v0 = _troupStorage.call(uint32(0x7a65efc9), _troupHash).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(_troupStorage.code.size));
        v1 = _troupStorage.call(uint32(0xf776c071), _troupHash, _name).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(_troupStorage.code.size));
        v2 = _troupStorage.call(uint32(0xc74d8903), _troupHash, _life).gas(msg.gas - 710);
        require(bool(v2));
        require(bool(_troupStorage.code.size));
        v3 = _troupStorage.call(uint32(0x80461f9), _troupHash, _strength).gas(msg.gas - 710);
        require(bool(v3));
        require(bool(_troupStorage.code.size));
        v4 = _troupStorage.call(uint32(0x41731f8b), _troupHash, _intelligence).gas(msg.gas - 710);
        require(bool(v4));
        require(bool(_troupStorage.code.size));
        v5 = _troupStorage.call(uint32(0x718de536), _troupHash, _dexterity).gas(msg.gas - 710);
        require(bool(v5));
        require(bool(_troupStorage.code.size));
        v6 = _troupStorage.call(uint32(0x70c92125), _troupHash, _gold).gas(msg.gas - 710);
        require(bool(v6));
        require(bool(_troupStorage.code.size));
        v7 = _troupStorage.call(uint32(0x9c8b8588), _troupHash, _wood).gas(msg.gas - 710);
        require(bool(v7));
        require(bool(_troupStorage.code.size));
        v8 = _troupStorage.call(uint32(0x6d0af38e), _troupHash, _stone).gas(msg.gas - 710);
        require(bool(v8));
    }

    function upgrade(address proxy, address implementation) 
        public 
    { 
        require(bool(proxy.code.size));
        v0 = proxy.transferOwnership(implementation).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getHash(address _troupStorage, uint256 _nonce) 
        public 
    {
        require(bool(_troupStorage.code.size));
        v0, /* uint256 */ v1 = _troupStorage.getHash(_nonce).gas(msg.gas - 710);
        require(bool(v0));
        return uint256(v1);
    }

    function getIndexLength(address _troupStorage) 
        public 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v0, /* uint256 */ v1 = _troupStorage.getIndexLength().gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getCosts(address _troupStorage, bytes32 _troupHash) 
        public 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v0, /* uint256 */ v1 = _troupStorage.call(uint32(0xe75f7871), _troupHash).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v2, /* uint256 */ v3 = _troupStorage.call(uint32(0xe382af35), _troupHash).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v4, /* uint256 */ v5 = _troupStorage.call(uint32(0xe0d87dc2), _troupHash).gas(msg.gas - 710);
        require(bool(v4));
        return v1, v3, v5;
    }

    function fallback() public payable { 
        revert();
    }

    function getTroup(address _troupStorage, bytes32 _troupHash)
        public 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v0, /* bytes16 */ v1 = _troupStorage.getName(_troupHash).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v2, /* uint256 */ v3 = _troupStorage.call(uint32(0x82f0b31c), _troupHash).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v4, /* uint256 */ v5 = _troupStorage.call(uint32(0x6453da9a), _troupHash).gas(msg.gas - 710);
        require(bool(v4));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v6, /* uint256 */ v7 = _troupStorage.call(uint32(0x79525281), _troupHash).gas(msg.gas - 710);
        require(bool(v6));
        MEM[32 + MEM[64]] = 0;
        require(bool(_troupStorage.code.size));
        v8, /* uint256 */ v9 = _troupStorage.call(uint32(0x9342ccc2), _troupHash).gas(msg.gas - 710);
        require(bool(v8));
        return bytes16(v1), v3, v5, v7, v9;
    }
}