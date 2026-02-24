pragma solidity 0.4.18;

/// @title TroupStorage for Realms of Ether (https://www.realmsofether.com)
/// @notice This contract is an on-chain storage contract that manages 
/// all persistent data for "troups" in Realms of Ether. The original source code 
/// has been lost, but is now completely reconstructed from its raw bytecode.
///
/// @author wilt.eth / @wilty_stilty
contract TroupStorage {
    address internal _owner;
    bytes32[] internal troupHashes;
    mapping (uint256 => bool) internal exists;
    mapping (uint256 => uint256) internal packedNames;
    mapping (uint256 => uint256) internal life;
    mapping (uint256 => uint256) internal strength;
    mapping (uint256 => uint256) internal intelligence;
    mapping (uint256 => uint256) internal dexterity;
    mapping (uint256 => uint256) internal gold;
    mapping (uint256 => uint256) internal wood;
    mapping (uint256 => uint256) internal stone;
    
    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function TroupStorage() public {
        _owner = msg.sender;
    }

    function() public payable {
        revert();
    }

    function setStrength(bytes32 _troupHash, uint256 _amount) 
        public
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        strength[troupId] = _amount;
    }

    function setIntelligence(bytes32 _troupHash, uint256 _amount) 
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        intelligence[troupId] = _amount;
    }

    function getName(bytes32 _troupHash) 
        public
        returns (bytes16)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return bytes16(packedNames[troupId] << 128);
    }

    function getStrength(bytes32 _troupHash) 
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return strength[troupId];
    }

    function getHash(uint256 _nonce) 
        public 
        returns (bytes32)
    {
        require(_nonce < troupHashes.length);
        return troupHashes[_nonce];
    }

    function setStone(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        stone[troupId] = _amount;
    }

    function setGold(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        gold[troupId] = _amount;
    }

    function setDexterity(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        dexterity[troupId] = _amount;
    }

    function getIntelligence(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return intelligence[troupId];
    }

    function createTroup(bytes32 _troupHash)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(!exists[troupId]);

        uint256 i = troupHashes.length;
        troupHashes.length = i + 1;
        troupHashes[i] = _troupHash;

        exists[troupId] = true;
    }

    function getLife(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return life[troupId];
    }

    function owner() public returns (address) {
        return _owner;
    }

    function getDexterity(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return dexterity[troupId];
    }

    function setWood(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        wood[troupId] = _amount;
    }

    function setLife(bytes32 _troupHash, uint256 _amount)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        life[troupId] = _amount;
    }

    function getWood(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return wood[troupId];
    }

    function getIndexLength()
        public
        returns (uint256)
    { 
        return troupHashes.length;
    }

    function getStone(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return stone[troupId];
    }

    function getGold(bytes32 _troupHash)
        public
        returns (uint256)
    { 
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);
        return gold[troupId];
    }

    function transferOwnership(address newOwner) public { 
        require(msg.sender == _owner);
        require(bool(newOwner != address(0x0)));
        OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function setName(bytes32 _troupHash, bytes16 _name)
        public 
    { 
        require(msg.sender == _owner);
        uint256 troupId = uint256(_troupHash);
        require(exists[troupId]);

        packedNames[troupId] = (uint256(_name) >> 128) | uint256(bytes16(packedNames[troupId]));
    }
}