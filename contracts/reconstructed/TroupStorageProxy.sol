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

    function upgrade(address proxy, address implementation) public payable { 
        require(bool(proxy.code.size));
        v0 = proxy.transferOwnership(implementation).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getHash(address _tokenAddress, uint256 _tokenId) public payable { 
        MEM[32 + MEM[64]] = 0;
        require(bool(_tokenAddress.code.size));
        v0, /* uint256 */ v1 = _tokenAddress.getHash(_tokenId).gas(msg.gas - 710);
        require(bool(v0));
        return uint256(v1);
    }

    function 0xf5807181(address varg0) public payable { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.getIndexLength().gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function 0xfc85a0d2(address varg0, uint256 varg1) public payable { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0xe75f7871), varg1).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v2, /* uint256 */ v3 = varg0.call(uint32(0xe382af35), varg1).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v4, /* uint256 */ v5 = varg0.call(uint32(0xe0d87dc2), varg1).gas(msg.gas - 710);
        require(bool(v4));
        return v1, v3, v5;
    }

    function fallback() public payable { 
        revert();
    }

    function 0x2a33569e(address varg0, uint256 varg1) public payable { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* bytes16 */ v1 = varg0.getName(varg1).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v2, /* uint256 */ v3 = varg0.call(uint32(0x82f0b31c), varg1).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v4, /* uint256 */ v5 = varg0.call(uint32(0x6453da9a), varg1).gas(msg.gas - 710);
        require(bool(v4));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v6, /* uint256 */ v7 = varg0.call(uint32(0x79525281), varg1).gas(msg.gas - 710);
        require(bool(v6));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v8, /* uint256 */ v9 = varg0.call(uint32(0x9342ccc2), varg1).gas(msg.gas - 710);
        require(bool(v8));
        return bytes16(v1), v3, v5, v7, v9;
    }
}