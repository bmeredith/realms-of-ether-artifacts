// Decompiled by library.dedaub.com
// 2026.02.26 00:29 UTC
// Compiled using the solidity compiler version 0.4.7<=v<0.5.9





function fallback() public payable { 
    revert();
}

function 0x006dff11(address varg0, address varg1) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0xf5807181), varg1).gas(msg.gas - 710);
    require(bool(v0));
    return v1;
}

function 0x0d041e57(address varg0, uint256 varg1) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* bytes16 */ v1 = varg0.getName(varg1).gas(msg.gas - 710);
    require(bool(v0));
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v2, /* address */ v3 = varg0.getOwner(varg1).gas(msg.gas - 710);
    require(bool(v2));
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v4, /* uint256 */ v5 = varg0.call(uint32(0xcdf28eaf), varg1).gas(msg.gas - 710);
    require(bool(v4));
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v6, /* uint256 */ v7 = varg0.call(uint32(0x3141d0db), varg1).gas(msg.gas - 710);
    require(bool(v6));
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v8, /* uint256 */ v9 = varg0.call(uint32(0xb6d7e8a1), varg1).gas(msg.gas - 710);
    require(bool(v8));
    return bytes16(MEM[MEM[64]]), address(v3), v5, v7, v9;
}

function 0x0f1ed0c6(address varg0, uint256 varg1, address varg2) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.setOwner(varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
}

function 0x1253a59c(address varg0, uint256 varg1, uint256 varg2) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x70c92125), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
}

function 0x1777d529(address varg0) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0x468c7804)).gas(msg.gas - 710);
    require(bool(v0));
    return v1;
}

function 0x3f0a6f3d(address varg0) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0x10cfcf0c)).gas(msg.gas - 710);
    require(bool(v0));
    return v1;
}

function 0x4e49bbe1(address varg0, uint256 varg1, uint256 varg2) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0x31857c44), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v2, /* uint256 */ v3 = varg0.call(uint32(0xb41cddba), varg1, varg2).gas(msg.gas - 710);
    require(bool(v2));
    return v1, v3;
}

function 0x54c711ba(address varg0, address varg1, uint256 varg2) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0x78a11bf0), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
    return uint256(v1);
}

function 0x56c1c099(address varg0, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x45c7d3a6), varg1, varg2, varg3).gas(msg.gas - 710);
    require(bool(v0));
}

function 0x58e9eb78(address varg0, uint256 varg1) public payable { 
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

function getOwner(address account, bytes32 DATA) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(account.code.size));
    v0, /* address */ v1 = account.getOwner(uint256(DATA)).gas(msg.gas - 710);
    require(bool(v0));
    return address(v1);
}

function 0x7b2be003(address varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x70c92125), varg1, varg3).gas(msg.gas - 710);
    require(bool(v0));
    require(bool(varg0.code.size));
    v1 = varg0.call(uint32(0x6d0af38e), varg1, varg4).gas(msg.gas - 710);
    require(bool(v1));
    require(bool(varg0.code.size));
    v2 = varg0.call(uint32(0x9c8b8588), varg1, varg5).gas(msg.gas - 710);
    require(bool(v2));
    require(bool(varg0.code.size));
    v3 = varg0.call(uint32(0x8ff4efb7), varg1, varg2, varg6).gas(msg.gas - 710);
    require(bool(v3));
}

function 0x985a78d3(address varg0, uint256 varg1, uint256 varg2) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x6d0af38e), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
}

function upgrade(address proxy, address implementation) public payable { 
    require(bool(proxy.code.size));
    v0 = proxy.transferOwnership(implementation).gas(msg.gas - 710);
    require(bool(v0));
}

function 0xa04e8cb9(address varg0, uint256 varg1, uint256 varg2) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x9c8b8588), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
}

function 0xb844ad67(address varg0, uint256 varg1, address varg2) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.setOwner(varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
}

function 0xbd1fb981(address varg0, uint256 varg1, bytes16 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7, uint256 varg8, address varg9) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0x43244b61), varg1, varg9).gas(msg.gas - 710);
    require(bool(v0));
    require(bool(varg0.code.size));
    v1 = varg0.call(uint32(0xf776c071), varg1, varg2).gas(msg.gas - 710);
    require(bool(v1));
    require(bool(varg0.code.size));
    v2 = varg0.call(uint32(0x69c6821d), varg1, varg3).gas(msg.gas - 710);
    require(bool(v2));
    require(bool(varg0.code.size));
    v3 = varg0.call(uint32(0xb874b685), varg1, varg4).gas(msg.gas - 710);
    require(bool(v3));
    require(bool(varg0.code.size));
    v4 = varg0.call(uint32(0x70c92125), varg1, varg5).gas(msg.gas - 710);
    require(bool(v4));
    require(bool(varg0.code.size));
    v5 = varg0.call(uint32(0x6d0af38e), varg1, varg6).gas(msg.gas - 710);
    require(bool(v5));
    require(bool(varg0.code.size));
    v6 = varg0.call(uint32(0x9c8b8588), varg1, varg7).gas(msg.gas - 710);
    require(bool(v6));
    require(bool(varg0.code.size));
    v7 = varg0.call(uint32(0x2fb59b80), varg1, varg8).gas(msg.gas - 710);
    require(bool(v7));
}

function 0xd87f3856(address varg0) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.startMinting().gas(msg.gas - 710);
    require(bool(v0));
}

function 0xf28c3ee3(address varg0, uint256 varg1, uint256 varg2, uint256 varg3) public payable { 
    require(bool(varg0.code.size));
    v0 = varg0.call(uint32(0xb9d8a1cf), varg1, varg2, varg3).gas(msg.gas - 710);
    require(bool(v0));
}

function 0xfd1fd5ff(address varg0, uint256 varg1, uint256 varg2) public payable { 
    MEM[32 + MEM[64]] = 0;
    require(bool(varg0.code.size));
    v0, /* uint256 */ v1 = varg0.call(uint32(0x6c4426be), varg1, varg2).gas(msg.gas - 710);
    require(bool(v0));
    return v1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (0x6dff11 == v0) {
            0x006dff11();
        } else if (0xd041e57 == v0) {
            0x0d041e57();
        } else if (0xf1ed0c6 == v0) {
            0x0f1ed0c6();
        } else if (0x1253a59c == v0) {
            0x1253a59c();
        } else if (0x1777d529 == v0) {
            0x1777d529();
        } else if (0x3f0a6f3d == v0) {
            0x3f0a6f3d();
        } else if (0x4e49bbe1 == v0) {
            0x4e49bbe1();
        } else if (0x54c711ba == v0) {
            0x54c711ba();
        } else if (0x56c1c099 == v0) {
            0x56c1c099();
        } else if (0x58e9eb78 == v0) {
            0x58e9eb78();
        } else if (0x69c5b2b8 == v0) {
            getOwner(address,bytes32);
        } else if (0x7b2be003 == v0) {
            0x7b2be003();
        } else if (0x985a78d3 == v0) {
            0x985a78d3();
        } else if (0x99a88ec4 == v0) {
            upgrade(address,address);
        } else if (0xa04e8cb9 == v0) {
            0xa04e8cb9();
        } else if (0xb844ad67 == v0) {
            0xb844ad67();
        } else if (0xbd1fb981 == v0) {
            0xbd1fb981();
        } else if (0xd87f3856 == v0) {
            0xd87f3856();
        } else if (0xf28c3ee3 == v0) {
            0xf28c3ee3();
        } else if (0xfd1fd5ff == v0) {
            0xfd1fd5ff();
        }
    }
    fallback();
}
