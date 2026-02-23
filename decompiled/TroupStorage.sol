// Decompiled by library.dedaub.com
// 2026.02.20 18:47 UTC
// Compiled using the solidity compiler version 0.4.7<=v<0.5.9


// Data structures and variables inferred from the use of storage instructions
uint256[] _getIndexLength; // STORAGE[0x1]
mapping (uint256 => bool) _getName; // STORAGE[0x2]
mapping (uint256 => uint256) mapping_3; // STORAGE[0x3]
mapping (uint256 => uint256) mapping_4; // STORAGE[0x4]
mapping (uint256 => uint256) mapping_5; // STORAGE[0x5]
mapping (uint256 => uint256) mapping_6; // STORAGE[0x6]
mapping (uint256 => uint256) mapping_7; // STORAGE[0x7]
mapping (uint256 => uint256) mapping_8; // STORAGE[0x8]
mapping (uint256 => uint256) mapping_9; // STORAGE[0x9]
mapping (uint256 => uint256) mapping_a; // STORAGE[0xa]
address _owner; // STORAGE[0x0] bytes 0 to 19


// Events
OwnershipTransferred(address, address);

function fallback() public payable { 
    revert();
}

function 0x080461f9(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_5[varg0] = varg1;
}

function 0x41731f8b(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_6[varg0] = varg1;
}

function getName(bytes32 saleId) public nonPayable { 
    require(_getName[uint256(saleId)]);
    return bytes16(mapping_3[uint256(saleId)] << 128);
}

function 0x6453da9a(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_5[varg0];
}

function getHash(uint256 _nonce) public nonPayable { 
    assert(_nonce < _getIndexLength.length);
    return uint256(_getIndexLength[_nonce]);
}

function 0x6d0af38e(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_a[varg0] = varg1;
}

function 0x70c92125(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_8[varg0] = varg1;
}

function 0x718de536(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_7[varg0] = varg1;
}

function 0x79525281(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_6[varg0];
}

function 0x7a65efc9(uint256 varg0) public nonPayable { 
    require(msg.sender == _owner);
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

function 0x82f0b31c(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_4[varg0];
}

function owner() public nonPayable { 
    return _owner;
}

function 0x9342ccc2(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_7[varg0];
}

function 0x9c8b8588(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_9[varg0] = varg1;
}

function 0xc74d8903(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_4[varg0] = varg1;
}

function 0xe0d87dc2(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_9[varg0];
}

function getIndexLength() public nonPayable { 
    return _getIndexLength.length;
}

function 0xe382af35(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_a[varg0];
}

function 0xe75f7871(uint256 varg0) public nonPayable { 
    require(_getName[varg0]);
    return mapping_8[varg0];
}

function transferOwnership(address newOwner) public nonPayable { 
    require(msg.sender == _owner);
    require(bool(newOwner != address(0x0)));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
}

function 0xf776c071(uint256 varg0, bytes16 varg1) public nonPayable { 
    require(msg.sender == _owner);
    require(_getName[varg0]);
    mapping_3[varg0] = varg1 >> 128 | bytes16(mapping_3[varg0]);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__( function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (0x80461f9 == v0) {
            0x080461f9();
        } else if (0x41731f8b == v0) {
            0x41731f8b();
        } else if (0x54b8d5e3 == v0) {
            getName(bytes32);
        } else if (0x6453da9a == v0) {
            0x6453da9a();
        } else if (0x6b2fafa9 == v0) {
            getHash(uint256);
        } else if (0x6d0af38e == v0) {
            0x6d0af38e();
        } else if (0x70c92125 == v0) {
            0x70c92125();
        } else if (0x718de536 == v0) {
            0x718de536();
        } else if (0x79525281 == v0) {
            0x79525281();
        } else if (0x7a65efc9 == v0) {
            0x7a65efc9();
        } else if (0x82f0b31c == v0) {
            0x82f0b31c();
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0x9342ccc2 == v0) {
            0x9342ccc2();
        } else if (0x9c8b8588 == v0) {
            0x9c8b8588();
        } else if (0xc74d8903 == v0) {
            0xc74d8903();
        } else if (0xe0d87dc2 == v0) {
            0xe0d87dc2();
        } else if (0xe1ba7d01 == v0) {
            getIndexLength();
        } else if (0xe382af35 == v0) {
            0xe382af35();
        } else if (0xe75f7871 == v0) {
            0xe75f7871();
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        } else if (0xf776c071 == v0) {
            0xf776c071();
        }
    }
    fallback();
}
