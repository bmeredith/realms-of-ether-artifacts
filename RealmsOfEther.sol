pragma solidity 0.4.19;

import "./Pausable.sol";

contract RealmsOfEther is Pausable {

    using SafeMath for uint256;

    // Data structures and variables inferred from the use of storage instructions
    //address _owner; // STORAGE[0x0] bytes 0 to 19
    //bool _paused; // STORAGE[0x0] bytes 20 to 20
    uint256 stor_1; // STORAGE[0x1] stor_1
    address stor_2_0_19; // STORAGE[0x2] bytes 0 to 19 stor_2_0_19
    address stor_3_0_19; // STORAGE[0x3] bytes 0 to 19 stor_3_0_19
    address stor_4_0_19; // STORAGE[0x4] bytes 0 to 19 stor_4_0_19
    uint256 stor_5; // STORAGE[0x5] stor_5
    uint256 stor_6; // STORAGE[0x6] stor_6
    uint256 stor_7; // STORAGE[0x7] stor_7
    mapping (uint256 => uint256) mapping_8; // STORAGE[0x8] mapping_8
    mapping (uint256 => address) mapping_9; // STORAGE[0x9] mapping_9
    mapping (uint256 => uint256) mapping_a; // STORAGE[0xa] mapping_a
    mapping (uint256 => address) _highestBidder; // STORAGE[0xb]
    mapping (address => uint256[]) _userAuctions; // STORAGE[0xc]
    mapping (uint256 => uint256) mapping_d; // STORAGE[0xd] mapping_d
    mapping (address => uint256) _balances; // STORAGE[0xe]
    uint256 _totalBalance; // STORAGE[0xf]
    uint256[] _getAuctionsLength; // STORAGE[0x10]
    int256 stor_11; // STORAGE[0x11] stor_11
    uint256 stor_12; // STORAGE[0x12] stor_12
    uint256 stor_13; // STORAGE[0x13] stor_13
    uint256 stor_14; // STORAGE[0x14] stor_14

    uint256 constant AUCTION_DURATION = 3 days;

    // Events
    event LogFortressCreated(
        bytes16 name,
        bytes32 hash,
        address owner,
        int256 x,
        int256 y
    );

    event LogBuild(
        bytes32 fortressHash,
        bytes32 buildingHash
    );

    event LogBuildingAction(
        bytes32 fortressHash,
        bytes32 buildingHash
    );

    event LogBuildingCreated(
        bytes32 buildingHash
    );

    event LogTroupCreated(
        bytes32 troupHash
    );

    function _getBuildingFromProxy(uint256 _buildingHash) 
        private 
        returns (
            uint256 rawName,
            uint256 rawAction,
            uint256 rawActionRate,
            uint256 rawActionValue,
            uint256 rawActionTimeout
        )
    {
        address proxy = 0xb939a1d96dda7271d6d89eaceabd9163d0502165;
        address storageAddr = stor_3_0_19;
        
        assembly {
            // require(extcodesize(proxy) > 0)
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            // calldata = selector(0x9d3bd2e4) + storageAddr + buildingHash
            mstore(ptr, shl(224, 0x9d3bd2e4))
            mstore(add(ptr, 4), and(storageAddr, 0xffffffffffffffffffffffffffffffffffffffff))
            mstore(add(ptr, 36), _buildingHash)

            // delegatecall(proxy, ptr, 68, 0, 0)
            let ok := delegatecall(sub(gas, 710), proxy, ptr, 68, 0, 0)
            if iszero(ok) { revert(0, 0) }

            // Expect 6 words back: (v0,v1,v2,v3,v4,v5) = 192 bytes
            if lt(returndatasize(), 192) { revert(0, 0) }
            returndatacopy(ptr, 0, 192)

            // require(v0 != 0)
            if iszero(mload(ptr)) { revert(0, 0) }

            // return v5, v4, v3, v2, v1 (matches the decompile’s reorder)
            rawName         := mload(add(ptr, 160)) // v5
            rawAction       := mload(add(ptr, 128)) // v4
            rawActionRate   := mload(add(ptr, 96))  // v3
            rawActionValue  := mload(add(ptr, 64))  // v2
            rawActionTimeout:= mload(add(ptr, 32))  // v1

            mstore(0x40, add(ptr, 192))
        }
    }

    function unknown_0x1393(uint256 _troupHash) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xfc85a0d2), stor_4_0_19, _troupHash).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x14f4(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xfc85a0d2), stor_3_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x1749(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x58e9eb78), stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x1a67(uint256 varg0, uint256 varg1) private { 
        MEM[64 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x4e49bbe1), stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v2, v1;
    }

    function unknown_0x1d04(uint256 varg0, uint256 varg1) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xfd1fd5ff), stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function fallback() public payable { 
        revert();
    }

    function endAuction(bytes32 _fortressHash) public whenNotPaused {
        require(mapping_8[_fortressHash] <= block.timestamp);
        require(_highestBidder[_fortressHash] == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), stor_2_0_19, _fortressHash, msg.sender).gas(msg.gas - 710);
        require(bool(v0));
        v1 = mapping_a[_fortressHash].sub(_balances[msg.sender]);
        _balances[msg.sender] = v1;
        mapping_d[keccak256(_fortressHash, msg.sender)] = 0;
        v2 = mapping_a[_fortressHash].add(mapping_d[keccak256(_fortressHash, mapping_9[_fortressHash])]);
        mapping_d[keccak256(_fortressHash, mapping_9[_fortressHash])] = v2;
        v3 = mapping_a[_fortressHash].add(_balances[mapping_9[_fortressHash]]);
        _balances[mapping_9[_fortressHash]] = v3;
    }

    function unknown_0x26af(uint256 varg0) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        return ;
    }

    function fortressStorage() public view returns (address) { 
        return stor_2_0_19;
    }

    function unknown_0x2811(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
        if (varg5 == stor_5) {
            v0 = varg3.add(1);
            v1 = v0.mul(varg4);
            v2 = v1.add(varg2);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
            v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1253a59c), stor_2_0_19, varg6, v2).gas(msg.gas - 710);
            require(bool(v3));
        }
        if (varg5 == stor_7) {
            v4 = varg3.add(1);
            v5 = v4.mul(varg4);
            v6 = v5.add(varg1);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
            v7 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x985a78d3), stor_2_0_19, varg6, v6).gas(msg.gas - 710);
            require(bool(v7));
        }
        if (varg5 != stor_6) {
            return ;
        } else {
            v8 = varg3.add(1);
            v9 = v8.mul(varg4);
            v10 = v9.add(varg0);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
            v11 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xa04e8cb9), stor_2_0_19, varg6, v10).gas(msg.gas - 710);
            require(bool(v11));
            return ;
        }
    }

    function balanceAuction(bytes32 varg0) public view returns (uint256) { 
        return mapping_d[varg0];
    }

    function unknown_0x2a52(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) private { 
        v0, v1, v2 = 0x1393(varg6);
        v3 = varg4.mul(varg5);
        v4 = v3.add(1);
        v5 = v4.mul(v2);
        v6 = v4.mul(v1);
        v7 = v4.mul(v0);
        v8 = v9 = varg3 >= v5;
        if (varg3 >= v5) {
            v8 = v10 = varg2 >= v6;
        }
        if (v8) {
            v8 = v11 = varg1 >= v7;
        }
        require(bool(v8));
        v12 = v5.sub(varg3);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v13 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1253a59c), stor_2_0_19, varg7, v12).gas(msg.gas - 710);
        require(bool(v13));
        v14 = v6.sub(varg2);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x985a78d3), stor_2_0_19, varg7, v14).gas(msg.gas - 710);
        require(bool(v15));
        v16 = v7.sub(varg1);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v17 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xa04e8cb9), stor_2_0_19, varg7, v16).gas(msg.gas - 710);
        require(bool(v17));
        v18 = v4.add(varg0);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v19 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x56c1c099), stor_2_0_19, varg7, varg6, v18).gas(msg.gas - 710);
        require(bool(v19));
        return ;
    }

    function getFortressCount() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x3f0a6f3d), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function unknown_0x2d54(uint256 varg0, uint256 varg1, uint256 varg2) private { 
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf28c3ee3), stor_2_0_19, varg2, varg1, varg0 * 3600 + block.timestamp).gas(msg.gas - 710);
        require(bool(v0));
        return ;
    }

    function getTroupHash(bytes32 varg0) public view { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.getHash(stor_4_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function createBuilding(bytes16 _name, uint256 _action, uint256 _actionRate, bytes32 _actionValue, uint256 _actionTimeout, uint256 _gold, uint256 _wood, uint256 _stone) public onlyOwner {
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(
            uint32(0xf481d125), 
            stor_3_0_19,
            keccak256(msg.sender, _name, stor_1), 
            _name, 
            _action, 
            _actionRate, 
            _actionValue, 
            _actionTimeout, 
            _gold, 
            _wood, 
            _stone
        ).gas(msg.gas - 710);
        require(bool(v0));
        LogBuildingCreated(keccak256(msg.sender, _name, stor_1));
        stor_1 += 1;
    }

    function balances(address varg0) public view returns (uint256) { 
        return _balances[varg0];
    }

    function build(bytes32 _fortressHash, bytes32 _buildingHash) public whenNotPaused {
        0x26af(_fortressHash);
        v0, v1, v2 = 0x1749(_fortressHash);
        v3, v4, v5 = 0x14f4(_buildingHash);
        v6, v7 = 0x1a67(_buildingHash, _fortressHash);
        v8  = v7.add(1);
        v9  = v8.mul(v5);
        v10 = v8.mul(v4);
        v11 = v8.mul(v3);
        v12 = v13 = v2 >= v9;
        if (v2 >= v9) {
            v12 = v14 = v1 >= v10;
        }
        if (v12) {
            v12 = v15 = v0 >= v11;
        }
        require(bool(v12));
        v16 = v9.sub(v2);
        v17 = v10.sub(v1);
        v18 = v11.sub(v0);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v19 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x7b2be003), stor_2_0_19, _fortressHash, _buildingHash, v16, v17, v18, v8).gas(msg.gas - 710);
        require(bool(v19));
        LogBuild(_fortressHash, _buildingHash);
    }

    function troupStorage() public view returns (address) { 
        return stor_4_0_19;
    }

    function getFortressesAvailable() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1777d529), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getTroupIndexLength() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xf5807181), stor_4_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function createFortress(bytes16 _name) public payable whenNotPaused {
        require(msg.value >= 10 ** 16);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xbd1fb981), stor_2_0_19, keccak256(msg.sender, _name, stor_1), _name, stor_11, stor_12, 200, 400, 500, 0, msg.sender).gas(msg.gas - 710);
        require(bool(v0));
        v1 = v2 = stor_11 == stor_12;
        if (stor_11 != stor_12) {
            v1 = v3 = stor_11 < 0;
            if (v3) {
                v1 = v4 = stor_11 == 0 - stor_12;
            }
        }
        if (!v1) {
            v1 = v5 = stor_11 > 0;
            if (v5) {
                v1 = v6 = stor_11 == 1 - stor_12;
            }
        }
        if (v1) {
            stor_13 = 0 - stor_14;
            stor_14 = stor_13;
        }
        stor_11 += stor_13;
        stor_12 += stor_14;
        LogFortressCreated(_name, keccak256(msg.sender, _name, stor_1), msg.sender, stor_11, stor_12);
        stor_1 += 1;
    }

    function auctions(uint256 varg0) public view returns (bytes32) { 
        assert(varg0 < _getAuctionsLength.length);
        return _getAuctionsLength[varg0];
    }

    function highestBid(bytes32 varg0) public view returns (uint256) { 
        return mapping_a[varg0];
    }

    function getBuilding(bytes32 _buildingHash)
        public
        view
        returns (
            bytes16 _name,
            uint256 _action,
            uint256 _actionRate,
            bytes32 _actionValue,
            uint256 _actionTimeout
        ) 
    { 
        uint256 rawName;
        uint256 rawAction;
        uint256 rawActionRate;
        uint256 rawActionValue;
        uint256 rawActionTimeout;

        (rawName, rawAction, rawActionRate, rawActionValue, rawActionTimeout) =
            _getBuildingFromProxy(uint256(_buildingHash));

        // Interpret raw words into ABI types.
        _name = bytes16(rawName);            // takes the low 16 bytes of the word
        _action = rawAction;
        _actionRate = rawActionRate;
        _actionValue = bytes32(rawActionValue);
        _actionTimeout = rawActionTimeout;
    }

    function getTroupCosts(bytes32 _troupHash)
        public
        view
        returns (
            uint256 _gold,
            uint256 _stone,
            uint256 _wood
        ) 
    {
        uint256 wood;
        uint256 stone;
        uint256 gold;

        (wood, stone, gold) = 0x1393(uint256(_troupHash));

        return (gold, stone, wood);
    }

    function auctionEnd(bytes32 varg0) public view returns (uint256) { 
        return mapping_8[varg0];
    }

    function getHashFromIndex(address _user, uint256 _index) public view returns (bytes32) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x54c711ba), stor_2_0_19, _user, _index).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuildingCosts(bytes32 _buildingHash)
        public 
        view 
        returns (
            uint256 _gold,
            uint256 _stone,
            uint256 _wood
        ) 
    {
        uint256 wood;
        uint256 stone;
        uint256 gold;

        (wood, stone, gold) = 0x14f4(uint256(_buildingHash));
        
        return (gold, stone, wood);
    }

    function getTroup(bytes32 _troupHash)
        public
        view
        returns (
            bytes16 _name,
            uint256 _life,
            uint256 _strength,
            uint256 _intelligence,
            uint256 _dexterity
        )
    { 
        address proxy = 0x902904b1833def4aef05b99cea93cc3383cd2d4a;
        address storageAddr = stor_4_0_19;

        bool success;
        bytes16 name;
        uint256 life;
        uint256 strength;
        uint256 intelligence;
        uint256 dexterity;

        assembly {
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            mstore(ptr, shl(224, 0x2a33569e))
            mstore(add(ptr, 4), storageAddr)
            mstore(add(ptr, 36), _troupHash)

            success := delegatecall(sub(gas, 710), proxy, ptr, 68, 0, 0)
            if iszero(success) { revert(0, 0) }

            returndatacopy(ptr, 0, returndatasize())

            name         := mload(add(ptr, 32))
            life         := mload(add(ptr, 64))
            strength     := mload(add(ptr, 96))
            intelligence := mload(add(ptr, 128))
            dexterity    := mload(add(ptr, 160))
        }

        return (name, life, strength, intelligence, dexterity);
    }

    function stoneHash() public view returns (bytes32) { 
        return stor_7;
    }

    function transferFortress(bytes32 _fortressHash, address _newOwner) public whenNotPaused {
        0x26af(_fortressHash);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xb844ad67), stor_2_0_19, _fortressHash, _newOwner).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getUserAuctionsLength(address _user) public returns (uint256) { 
        return _userAuctions[_user].length;
    }

    function goldHash() public view returns (bytes32) { 
        return stor_5;
    }

    function getResources(bytes32 _fortressHash) 
        public 
        view 
        returns (
            uint256 _gold,
            uint256 _stone,
            uint256 _wood
        )  
    { 
        uint256 wood;
        uint256 stone;
        uint256 gold;

        (wood, stone, gold) = 0x1749(uint256(_fortressHash));
        
        return (gold, stone, wood);
    }

    function withdraw(bytes32 _fortressHash) public whenNotPaused {
        require(block.timestamp <= mapping_8[_fortressHash]);
        require(_highestBidder[_fortressHash] != msg.sender);

        bytes32 key = keccak256(_fortressHash, msg.sender);
        
        // cache amount first (matches Tenderly showing the SLOAD before SSTORE)
        uint256 amount = mapping_d[key];

        // clear pending balance (even if it's already 0)
        mapping_d[key] = 0;
        _balances[msg.sender] = mapping_d[key].sub(_balances[msg.sender]);
        _totalBalance = mapping_d[key].sub(_totalBalance);

        require(msg.sender.call.value(amount).gas(2300)());
    }

    function createTroup(bytes16 _name, uint256 _life, uint256 _strength, uint256 _intelligence, uint256 _dexterity, uint256 _gold, uint256 _wood, uint256 _stone) public onlyOwner {
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0x93fdc929), stor_4_0_19, keccak256(msg.sender, _name, stor_1), _name, _life, _strength, _intelligence, _dexterity, _gold, _wood, _stone).gas(msg.gas - 710);
        require(bool(v0));
        LogTroupCreated(keccak256(msg.sender, _name, stor_1));
        stor_1 += 1;
    }

    function getFortressBuilding(bytes32 _fortressHash, bytes32 _buildingHash) 
        public 
        view 
        returns (
            uint256 _level, 
            uint256 _timeout
        )
    { 
        (uint256 timeout, uint256 level) = 0x1a67(uint256(_buildingHash), uint256(_fortressHash));
        return (level, timeout);
    }

    function startMinting() public onlyOwner {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xd87f3856), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
    }

    function woodHash() 
        public
        view 
        returns (bytes32) 
    { 
        return stor_6;
    }

    function totalBalance() 
        public 
        view 
        returns (uint256) 
    { 
        return _totalBalance;
    }

    function withdrawExcess(address _withdraw) public onlyOwner {
        v0 = _totalBalance.sub((address(this)).balance);
        v1 = _withdraw.call().value(v0).gas(!v0 * 2300);
        require(bool(v1));
    }

    function userAuctions(address varg0, uint256 varg1) 
        public 
        view
        returns (bytes32)
    { 
        assert(varg1 < _userAuctions[varg0].length);
        return _userAuctions[varg0][varg1];
    }

    function highestBidder(bytes32 hash) 
        public 
        view 
        returns (address)
    { 
        return _highestBidder[hash];
    }

    function getFortress(bytes32 _fortressHash) 
        public
        returns (
            bytes16 _name,
            address _owner,
            int256 _x,
            int256 _y,
            uint256 _wins
        )
    { 
        address proxy = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a;
        address storageAddr = stor_2_0_19;

        assembly {
            // Ensure proxy has code (matches decompile require(proxy.code.size))
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            // ---------------------------------------------------------------------
            // Build calldata:
            // selector: 0x0d041e57
            // args: (address storageAddr, bytes32 _fortressHash)
            // total size: 4 + 32 + 32 = 68 bytes
            // ---------------------------------------------------------------------
            mstore(ptr, shl(224, 0x0d041e57))
            mstore(add(ptr, 4), storageAddr)
            mstore(add(ptr, 36), _fortressHash)

            // delegatecall(gas - 710, proxy, ptr, 68, 0, 0)
            if iszero(delegatecall(sub(gas, 710), proxy, ptr, 68, 0, 0)) {
                revert(0, 0)
            }

            // ---------------------------------------------------------------------
            // Expected return:
            // bytes16 name
            // address owner
            // uint256 x
            // uint256 y
            // uint256 wins
            //
            // 5 * 32 = 160 bytes
            // ---------------------------------------------------------------------
            returndatacopy(ptr, 0, 160)

            // Decode from memory
            _name  := mload(add(ptr, 32))
            _owner := mload(add(ptr, 64))
            _x     := mload(add(ptr, 96))
            _y     := mload(add(ptr, 128))
            _wins  := mload(add(ptr, 160))
        }
    }

    function auctionOwner(bytes32 varg0) 
        public
        view
        returns (address)
    { 
        return mapping_9[varg0];
    }

    function getFortressTroups(bytes32 _fortressHash, bytes32 _troupHash) 
        public
        view
        returns (_amount uint256)
    { 
        v0 = 0x1d04(uint256(_troupHash), uint256(_fortressHash));
        return v0;
    }

    function getAuctionAmount(bytes32 _fortressHash, address _user) 
        public
        view
        returns (uint256)
    { 
        return mapping_d[keccak256(_fortressHash, _user)];
    }

    function bidAuction(bytes32 _fortressHash) 
        public 
        payable 
        whenNotPaused 
    {
        require(block.timestamp < mapping_8[_fortressHash]);
        v0 = AUCTION_DURATION.sub(mapping_8[_fortressHash]);
        require(block.timestamp > v0);
        assert(bool(100));
        v1 = uint256(1).mul(msg.value / 100);
        v2 = v1.sub(msg.value);
        v3 = keccak256(_fortressHash, msg.sender);
        if (!bool(mapping_d[v3])) {
            _userAuctions[msg.sender].length = _userAuctions[msg.sender].length + 1;
            if (!_userAuctions[msg.sender].length <= _userAuctions[msg.sender].length + 1) {
                v4 = v5 = _userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
                while (keccak256(keccak256(msg.sender, 12)) + _userAuctions[msg.sender].length > v4) {
                    STORAGE[v4] = 0;
                    v4 += 1;
                }
            }
            _userAuctions[msg.sender][_userAuctions[msg.sender].length] = _fortressHash;
        }
        v6 = v2.add(mapping_d[v3]);
        mapping_d[v3] = v6;
        v7 = v2.add(_balances[msg.sender]);
        _balances[msg.sender] = v7;
        v8 = v2.add(_totalBalance);
        _totalBalance = v8;
        v9 = (10 ** 16).add(mapping_a[_fortressHash]);
        if (mapping_d[v3] >= v9) {
            mapping_a[_fortressHash] = mapping_d[v3];
            _highestBidder[_fortressHash] = msg.sender;
        }
    }

    function getBuildingHash(uint256 _index) 
        public
        view
        returns (bytes32)
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.getHash(stor_3_0_19, _index).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuildingIndexLength() 
        public 
        view
        returns (uint256)
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xf5807181), stor_3_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getAuctionsLength() 
        public 
        view
        returns (uint256)
    { 
        return _getAuctionsLength.length;
    }

    function buildingAction(bytes32 _fortressHash, bytes32 _buildingHash) 
        public 
        whenNotPaused
    {
        0x26af(uint256(_fortressHash));
        v0, v1 = 0x1a67(uint256(_buildingHash), uint256(_fortressHash));
        require(block.timestamp > v0);
        v2, v3, v4, v5, v6 = _getBuildingFromProxy(uint256(_buildingHash));
        v7, v8, v9 = 0x1749(uint256(_fortressHash));
        if (v5 == 1) {
            0x2811(v7, v8, v9, v1, v4, v3, uint256(_fortressHash));
        }
        if (2 == v5) {
            v10 = 0x1d04(v3, uint256(_fortressHash));
            0x2a52(v10, v7, v8, v9, v1, v4, v3, uint256(_fortressHash));
        }
        0x2d54(v2, uint256(_buildingHash), uint256(_fortressHash));
        LogBuildingAction(_fortressHash, _buildingHash);
    }

    function upgradeGame(address _newContract) 
        public
        onlyOwner
    {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.upgrade(stor_2_0_19, _newContract).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.upgrade(stor_3_0_19, _newContract).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v2 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.upgrade(stor_4_0_19, _newContract).gas(msg.gas - 710);
        require(bool(v2));
    }

    function buildingStorage() 
        public 
        view
        returns (address)
    { 
        return stor_3_0_19;
    }

    function startAuction(bytes32 _fortressHash /* fortress hash */) 
        public 
        whenNotPaused 
    {
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(stor_2_0_19, _fortressHash).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), stor_2_0_19, _fortressHash, address(this)).gas(msg.gas - 710);
        require(bool(v2));
        _highestBidder[_fortressHash] = msg.sender;
        mapping_a[_fortressHash] = 0;
        mapping_9[_fortressHash] = msg.sender;
        mapping_8[_fortressHash] = block.timestamp + AUCTION_DURATION;
        _userAuctions[msg.sender].length = _userAuctions[msg.sender].length + 1;
        if (!_userAuctions[msg.sender].length <= _userAuctions[msg.sender].length + 1) {
            v3 = v4 = _userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
            while (keccak256(keccak256(msg.sender, 12)) + _userAuctions[msg.sender].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        _userAuctions[msg.sender][_userAuctions[msg.sender].length] = _fortressHash;
        _getAuctionsLength.length = _getAuctionsLength.length + 1;
        if (!_getAuctionsLength.length <= _getAuctionsLength.length + 1) {
            v5 = v6 = _getAuctionsLength.length + 1 + keccak256(16);
            while (keccak256(16) + _getAuctionsLength.length > v5) {
                STORAGE[v5] = 0;
                v5 += 1;
            }
        }
        _getAuctionsLength[_getAuctionsLength.length] = _fortressHash;
    }

    function getIndexLength(address _user) 
        public
        view
        returns (uint256)
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x6dff11), stor_2_0_19, address(_user)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }
}