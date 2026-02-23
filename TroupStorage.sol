pragma solidity 0.4.19;

import "./Ownable.sol";

contract TroupStorage is Ownable {
    // address _owner; // STORAGE[0x0] bytes 0 to 19
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

    function fallback() public payable { 
        revert();
    }

    // 0x080461f9
    function setStrength(bytes32 varg0, uint256 varg1) 
        public
        onlyOwner
    { 
        require(_getName[varg0]);
        mapping_5[varg0] = varg1;
    }

    // 0x41731f8b
    function setIntelligence(bytes32 varg0, uint256 varg1) 
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_6[varg0] = varg1;
    }

    // 0x54b8d5e3
    function getName(bytes32 saleId) public { 
        require(_getName[uint256(saleId)]);
        return bytes16(mapping_3[uint256(saleId)] << 128);
    }

    // 0x6453da9a
    function getStrength(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_5[varg0];
    }

    // 0x6b2fafa9
    function getHash(uint256 _nonce) public { 
        assert(_nonce < _getIndexLength.length);
        return uint256(_getIndexLength[_nonce]);
    }

    // 0x6d0af38e
    function setStone(bytes32 varg0, uint256 varg1)
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_a[varg0] = varg1;
    }

    // 0x70c92125
    function setGold(bytes32 varg0, uint256 varg1)
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_8[varg0] = varg1;
    }

    // 0x718de536
    function setDexterity(bytes32 varg0, uint256 varg1)
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_7[varg0] = varg1;
    }

    // 0x79525281
    function getIntelligence(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_6[varg0];
    }

    // 0x7a65efc9
    function createTroup(bytes32 varg0)
        public 
        onlyOwner
    {
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

    // 0x82f0b31c
    function getLife(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_4[varg0];
    }

    // 0x9342ccc2
    function getDexterity(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_7[varg0];
    }

    // 0x9c8b8588
    function setWood(bytes32 varg0, uint256 varg1)
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_9[varg0] = varg1;
    }

    // 0xc74d8903
    function setLife(bytes32 varg0, uint256 varg1)
        public 
        onlyOwner
    {
        require(_getName[varg0]);
        mapping_4[varg0] = varg1;
    }

    // 0xe0d87dc2
    function getWood(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_9[varg0];
    }

    // 0xe1ba7d01
    function getIndexLength() public { 
        return _getIndexLength.length;
    }

    // 0xe382af35
    function getStone(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_a[varg0];
    }

    // 0xe75f7871
    function getGold(bytes32 varg0) public { 
        require(_getName[varg0]);
        return mapping_8[varg0];
    }

    // 0xf776c071
    function setName(bytes32 varg0, bytes16 varg1)
        public 
        onlyOwner
    { 
        require(_getName[varg0]);
        mapping_3[varg0] = varg1 >> 128 | bytes16(mapping_3[varg0]);
    }
}