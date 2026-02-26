// Decompiled by library.dedaub.com
// 2026.02.20 18:59 UTC
// Compiled using the solidity compiler version 0.4.7<=v<0.5.9


// Data structures and variables inferred from the use of storage instructions
uint256 _genesisTime; // STORAGE[0x1]
uint256 stor_2; // STORAGE[0x2]
mapping (address => uint256[]) mapping_3; // STORAGE[0x3]
mapping (address => uint256) mapping_4; // STORAGE[0x4]
mapping (address => uint256) _balanceOf; // STORAGE[0x5]
mapping (uint256 => uint256) mapping_6; // STORAGE[0x6]
uint256[] array_7; // STORAGE[0x7]
mapping (uint256 => bool) _getName; // STORAGE[0x8]
mapping (uint256 => uint256) mapping_9; // STORAGE[0x9]
mapping (uint256 => address) _getOwner; // STORAGE[0xa]
mapping (uint256 => uint256) mapping_b; // STORAGE[0xb]
mapping (uint256 => uint256) mapping_c; // STORAGE[0xc]
mapping (uint256 => uint256) mapping_d; // STORAGE[0xd]
mapping (uint256 => uint256) mapping_e; // STORAGE[0xe]
mapping (uint256 => uint256) mapping_f; // STORAGE[0xf]
mapping (uint256 => uint256) mapping_10; // STORAGE[0x10]
mapping (uint256 => uint256) mapping_12; // STORAGE[0x12]
mapping (uint256 => uint256) mapping_13; // STORAGE[0x13]
address _owner; // STORAGE[0x0] bytes 0 to 19


// Events
OwnershipTransferred(address, address);

function 0x11f9() private { 
    v0 = 0xbc1();
    v1 = _SafeSub(array_7.length, v0);
    return v1;
}

function fallback() public payable { 
    revert();
}

function 0x10cfcf0c() public nonPayable { 
    return array_7.length;
}

function totalSupply() public nonPayable { 
    v0 = 0xbc1();
    return v0;
}

function 0x2fb59b80(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_10[varg0] = varg1;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    v0 = varg1 + varg0 >= varg1;
    assert(bool(v0));
    return varg1 + varg0;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    assert(varg0 <= varg1);
    return varg1 - varg0;
}

function 0x3141d0db(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_c[varg0];
}

function 0x31857c44(uint256 varg0, uint256 varg1) public nonPayable { 
    require(_getName[varg0]);
    return mapping_12[uint256(keccak256(varg0, varg1))];
}

function genesisTime() public nonPayable { 
    return _genesisTime;
}

function 0x43244b61(uint256 varg0, address varg1) public nonPayable { 
    require(msg.sender == _owner);
    v0 = 0x11f9();
    require(v0 > array_7.length);
    require(bool(!_getName[varg0]));
    array_7.length += 1;
    if (!array_7.length <= 1 + array_7.length) {
        v1 = v2 = keccak256(7) + (1 + array_7.length);
        while (keccak256(7) + array_7.length > v1) {
            STORAGE[v1] = 0;
            v1 += 1;
        }
    }
    array_7[array_7.length] = varg0;
    _getName[varg0] = 1;
    _getOwner[varg0] = varg1;
    mapping_3[varg1].length += 1;
    if (!mapping_3[varg1].length <= 1 + mapping_3[varg1].length) {
        v3 = v4 = keccak256(keccak256(varg1, 3)) + (1 + mapping_3[varg1].length);
        while (keccak256(keccak256(varg1, 3)) + mapping_3[varg1].length > v3) {
            STORAGE[v3] = 0;
            v3 += 1;
        }
    }
    mapping_3[varg1][mapping_3[varg1].length] = varg0;
    mapping_6[varg0] = mapping_4[varg1];
    v5 = _SafeAdd(1, mapping_4[varg1]);
    mapping_4[varg1] = v5;
    v6 = _SafeAdd(1, _balanceOf[varg1]);
    _balanceOf[varg1] = v6;
}

function 0x45c7d3a6(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_10[uint256(keccak256(varg0, varg1))] = varg2;
}

function 0x468c7804() public nonPayable { 
    v0 = 0x11f9();
    return v0;
}

function getName(bytes32 saleId) public nonPayable { 
    require(_getName[uint256(saleId)]);
    return bytes16(mapping_9[uint256(saleId)] << 128);
}

function setOwner(bytes32 node, address owner) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[uint256(node)]);
    assert(mapping_6[uint256(node)] < mapping_3[_getOwner[uint256(node)]].length);
    mapping_3[_getOwner[uint256(node)]][mapping_6[uint256(node)]] = uint256(0);
    v0 = _SafeSub(1, _balanceOf[_getOwner[uint256(node)]]);
    _balanceOf[_getOwner[uint256(node)]] = v0;
    _getOwner[uint256(node)] = owner;
    mapping_3[owner].length += 1;
    if (!mapping_3[owner].length <= 1 + mapping_3[owner].length) {
        v1 = v2 = keccak256(keccak256(owner, 3)) + (1 + mapping_3[owner].length);
        while (keccak256(keccak256(owner, 3)) + mapping_3[owner].length > v1) {
            STORAGE[v1] = 0;
            v1 += 1;
        }
    }
    mapping_3[owner][mapping_3[owner].length] = uint256(node);
    mapping_6[uint256(node)] = mapping_4[owner];
    v3 = _SafeAdd(1, mapping_4[owner]);
    mapping_4[owner] = v3;
    v4 = _SafeAdd(1, _balanceOf[owner]);
    _balanceOf[owner] = v4;
}

function 0x5d694a72() public nonPayable { 
    return stor_2;
}

function 0x66a7045c(uint256 varg0) public nonPayable { 
    assert(varg0 < array_7.length);
    return uint256(array_7[varg0]);
}

function 0x69c6821d(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_b[varg0] = varg1;
}

function 0x6c4426be(uint256 varg0, uint256 varg1) public nonPayable { 
    require(_getName[varg0]);
    return mapping_10[uint256(keccak256(varg0, varg1))];
}

function 0x6d0af38e(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_f[varg0] = varg1;
}

function balanceOf(address account) public nonPayable { 
    return _balanceOf[account];
}

function 0x70c92125(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_d[varg0] = varg1;
}

function 0x7679bede(uint256 varg0) public nonPayable { 
    return mapping_6[varg0];
}

function 0x78a11bf0(address varg0, uint256 varg1) public nonPayable { 
    assert(varg1 < mapping_3[varg0].length);
    return uint256(mapping_3[varg0][varg1]);
}

function 0x7ce3705e(address varg0) public nonPayable { 
    return _balanceOf[varg0];
}

function owner() public nonPayable { 
    return _owner;
}

function 0x8ff4efb7(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_12[uint256(keccak256(varg0, varg1))] = varg2;
}

function startMinting() public nonPayable { 
    require(msg.sender == _owner);
    require(_genesisTime == 0);
    _genesisTime = block.timestamp;
}

function 0x9c8b8588(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_e[varg0] = varg1;
}

function 0xab756f29(address varg0) public nonPayable { 
    return mapping_4[varg0];
}

function 0xb41cddba(uint256 varg0, uint256 varg1) public nonPayable { 
    require(_getName[varg0]);
    return mapping_13[uint256(keccak256(varg0, varg1))];
}

function 0xb6d7e8a1(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_10[varg0];
}

function 0xb874b685(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_c[varg0] = varg1;
}

function 0xb9d8a1cf(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_13[uint256(keccak256(varg0, varg1))] = varg2;
}

function 0xc2fe3942(address varg0, uint256 varg1) public nonPayable { 
    assert(varg1 < mapping_3[varg0].length);
    return uint256(mapping_3[varg0][varg1]);
}

function 0xcdf28eaf(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_b[varg0];
}

function 0xcf2dd7d1(uint256 varg0) public nonPayable { 
    return _getName[varg0];
}

function getOwner(bytes32 _domainHash) public nonPayable { 
    require(_getName[uint256(_domainHash)]);
    return _getOwner[uint256(_domainHash)];
}

function 0xe0d87dc2(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_e[varg0];
}

function 0xe382af35(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_f[varg0];
}

function 0xe75f7871(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_d[varg0];
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.sender == _owner);
    require(bool(newOwner != address(0x0)));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}

function 0xf5807181(address varg0) public nonPayable { 
    return mapping_4[varg0];
}

function 0xf776c071(uint256 varg0, bytes16 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_9[varg0] = varg1 >> 128 | bytes16(mapping_9[varg0]);
}

function 0xbc1() private { 
    if (_genesisTime != 0) {
        assert(bool(900));
        v0 = _SafeAdd((block.timestamp - _genesisTime) / 900, stor_2);
        return v0;
    } else {
        return stor_2;
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (0x10cfcf0c == v0) {
            0x10cfcf0c();
        } else if (0x18160ddd == v0) {
            totalSupply();
        } else if (0x2fb59b80 == v0) {
            0x2fb59b80();
        } else if (0x3141d0db == v0) {
            0x3141d0db();
        } else if (0x31857c44 == v0) {
            0x31857c44();
        } else if (0x42c6498a == v0) {
            genesisTime();
        } else if (0x43244b61 == v0) {
            0x43244b61();
        } else if (0x45c7d3a6 == v0) {
            0x45c7d3a6();
        } else if (0x468c7804 == v0) {
            0x468c7804();
        } else if (0x54b8d5e3 == v0) {
            getName(bytes32);
        } else if (0x5b0fc9c3 == v0) {
            setOwner(bytes32,address);
        } else if (0x5d694a72 == v0) {
            0x5d694a72();
        } else if (0x66a7045c == v0) {
            0x66a7045c();
        } else if (0x69c6821d == v0) {
            0x69c6821d();
        } else if (0x6c4426be == v0) {
            0x6c4426be();
        } else if (0x6d0af38e == v0) {
            0x6d0af38e();
        } else if (0x70a08231 == v0) {
            balanceOf(address);
        } else if (0x70c92125 == v0) {
            0x70c92125();
        } else if (0x7679bede == v0) {
            0x7679bede();
        } else if (0x78a11bf0 == v0) {
            0x78a11bf0();
        } else if (0x7ce3705e == v0) {
            0x7ce3705e();
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0x8ff4efb7 == v0) {
            0x8ff4efb7();
        } else if (0x9a65ea26 == v0) {
            startMinting();
        } else if (0x9c8b8588 == v0) {
            0x9c8b8588();
        } else if (0xab756f29 == v0) {
            0xab756f29();
        } else if (0xb41cddba == v0) {
            0xb41cddba();
        } else if (0xb6d7e8a1 == v0) {
            0xb6d7e8a1();
        } else if (0xb874b685 == v0) {
            0xb874b685();
        } else if (0xb9d8a1cf == v0) {
            0xb9d8a1cf();
        } else if (0xc2fe3942 == v0) {
            0xc2fe3942();
        } else if (0xcdf28eaf == v0) {
            0xcdf28eaf();
        } else if (0xcf2dd7d1 == v0) {
            0xcf2dd7d1();
        } else if (0xdeb931a2 == v0) {
            getOwner(bytes32);
        } else if (0xe0d87dc2 == v0) {
            0xe0d87dc2();
        } else if (0xe382af35 == v0) {
            0xe382af35();
        } else if (0xe75f7871 == v0) {
            0xe75f7871();
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        } else if (0xf5807181 == v0) {
            0xf5807181();
        } else if (0xf776c071 == v0) {
            0xf776c071();
        }
    }
    fallback();
}
