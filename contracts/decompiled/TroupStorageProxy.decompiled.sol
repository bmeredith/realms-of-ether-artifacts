function 0x93fdc929(address varg0, uint256 varg1, bytes16 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, uint256 varg9) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x7a65efc9), varg1).gas(msg.gas - 710);
    require(bool(v0));
    require(bool(varg0.code.size));
    v1 = varg0.call(uint32(0xf776c071), varg1, varg2).gas(msg.gas - 710);
    require(bool(v1));
    require(bool(varg0.code.size));
    v2 = varg0.call(uint32(0xc74d8903), varg1, varg3).gas(msg.gas - 710);
    require(bool(v2));
    require(bool(varg0.code.size));
    v3 = varg0.call(uint32(0x80461f9), varg1, varg4).gas(msg.gas - 710);
    require(bool(v3));
    require(bool(varg0.code.size));
    v4 = varg0.call(uint32(0x41731f8b), varg1, varg5).gas(msg.gas - 710);
    require(bool(v4));
    require(bool(varg0.code.size));
    v5 = varg0.call(uint32(0x718de536), varg1, varg6).gas(msg.gas - 710);
    require(bool(v5));
    require(bool(varg0.code.size));
    v6 = varg0.call(uint32(0x70c92125), varg1, varg7).gas(msg.gas - 710);
    require(bool(v6));
    require(bool(varg0.code.size));
    v7 = varg0.call(uint32(0x9c8b8588), varg1, varg8).gas(msg.gas - 710);
    require(bool(v7));
    require(bool(varg0.code.size));
    v8 = varg0.call(uint32(0x6d0af38e), varg1, varg9).gas(msg.gas - 710);
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

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        if (0x2a33569e == uint32(function_selector >> 224)) {
            0x2a33569e();
        } else if (0x93fdc929 == uint32(function_selector >> 224)) {
            0x93fdc929();
        } else if (0x99a88ec4 == uint32(function_selector >> 224)) {
            upgrade(address,address);
        } else if (0xed05582b == uint32(function_selector >> 224)) {
            getHash(address,uint256);
        } else if (0xf5807181 == uint32(function_selector >> 224)) {
            0xf5807181();
        } else if (0xfc85a0d2 == uint32(function_selector >> 224)) {
            0xfc85a0d2();
        }
    }
    fallback();
}
