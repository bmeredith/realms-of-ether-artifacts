pragma solidity 0.4.19;

import "./Pausable.sol";

contract RealmsOfEther is Pausable {

    using SafeMath for uint256;

    // Data structures and variables inferred from the use of storage instructions
    //address _owner; // STORAGE[0x0] bytes 0 to 19
    //bool _paused; // STORAGE[0x0] bytes 20 to 20
    uint256 private nonce; // STORAGE[0x1] stor_1
    address public fortressStorage; // STORAGE[0x2] bytes 0 to 19 stor_2_0_19
    address public buildingStorage; // STORAGE[0x3] bytes 0 to 19 stor_3_0_19
    address public troupStorage; // STORAGE[0x4] bytes 0 to 19 stor_4_0_19
    bytes32 public goldHash; // STORAGE[0x5] stor_5
    bytes32 public woodHash; // STORAGE[0x6] stor_6
    bytes32 public stoneHash; // STORAGE[0x7] stor_7
    mapping (bytes32 => uint256) public auctionEnd; // STORAGE[0x8] mapping_8
    mapping (bytes32 => address) public auctionOwner; // STORAGE[0x9] mapping_9
    mapping (bytes32 => uint256) public highestBid; // STORAGE[0xa] mapping_a
    mapping (bytes32 => address) public highestBidder; // STORAGE[0xb]
    mapping (address => bytes32[]) public userAuctions; // STORAGE[0xc]
    mapping (bytes32 => uint256) public balanceAuction; // STORAGE[0xd] mapping_d
    mapping (address => uint256) public balances; // STORAGE[0xe]
    uint256 public totalBalance; // STORAGE[0xf]
    bytes32[] public auctions; // STORAGE[0x10]

    // used for the square spiral traversal logic as fortresses are created
    int256 private x; // STORAGE[0x11] stor_11 -> current X coordinate
    int256 private y; // STORAGE[0x12] stor_12 -> current Y coordinate
    int256 private dx; // STORAGE[0x13] stor_13 -> direction step for X
    int256 private dy; // STORAGE[0x14] stor_14 -> direction step for Y

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

    function RealmsOfEther(
        address _fortressStorage,
        address _troupStorage,
        address _buildingStorage
    )
        public 
    {
        require(msg.value == 0);

        fortressStorage = _fortressStorage;
        troupStorage    = _troupStorage;
        buildingStorage = _buildingStorage;

        goldHash = keccak256("Gold");
        woodHash = keccak256("Wood");
        stoneHash = keccak256("Stone");

        x = 0;
        y = 0;
        dx = 0;
        dy = -1;
    }

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
        address storageAddr = buildingStorage;
        
        assembly {
            // require(extcodesize(proxy) > 0)
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            // calldata = selector(0x9d3bd2e4) + storageAddr + buildingHash
            // 0x9d3bd2e4 = getBuilding(address,bytes32)
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

        // 0xfc85a0d2 = getCosts(address,bytes32)
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xfc85a0d2), troupStorage, _troupHash).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x14f4(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        
        // 0xfc85a0d2 = getCosts(address,bytes32)
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xfc85a0d2), buildingStorage, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x1749(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0x58e9eb78 = getResources(address,bytes32)
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x58e9eb78), fortressStorage, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function unknown_0x1a67(uint256 varg0, uint256 varg1) private { 
        MEM[64 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0x4e49bbe1 = getBuilding(address,bytes32,bytes32)
        v0, /* uint256 */ v1, /* uint256 */ v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x4e49bbe1), fortressStorage, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v2, v1;
    }

    function unknown_0x1d04(uint256 varg0, uint256 varg1) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0xfd1fd5ff = getTroups(address,bytes32,bytes32)
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xfd1fd5ff), fortressStorage, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function fallback() public payable { 
        revert();
    }

    function endAuction(bytes32 _fortressHash) public whenNotPaused {
        require(auctionEnd[_fortressHash] <= block.timestamp);
        require(highestBidder[_fortressHash] == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        
        // 0xf1ed0c6 = setOwner(address,bytes32,address)
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), fortressStorage, _fortressHash, msg.sender).gas(msg.gas - 710);
        require(bool(v0));
        v1 = highestBid[_fortressHash].sub(balances[msg.sender]);
        balances[msg.sender] = v1;
        balanceAuction[keccak256(_fortressHash, msg.sender)] = 0;
        v2 = highestBid[_fortressHash].add(balanceAuction[keccak256(_fortressHash, auctionOwner[_fortressHash])]);
        balanceAuction[keccak256(_fortressHash, auctionOwner[_fortressHash])] = v2;
        v3 = highestBid[_fortressHash].add(balances[auctionOwner[_fortressHash]]);
        balances[auctionOwner[_fortressHash]] = v3;
    }

    function unknown_0x26af(uint256 varg0) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(fortressStorage, varg0).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        return ;
    }

    function unknown_0x2811(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
        if (varg5 == goldHash) {
            v0 = varg3.add(1);
            v1 = v0.mul(varg4);
            v2 = v1.add(varg2);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

            // 0x1253a59c = setGold(address,bytes32,uint256)
            v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1253a59c), fortressStorage, varg6, v2).gas(msg.gas - 710);
            require(bool(v3));
        }
        if (varg5 == stoneHash) {
            v4 = varg3.add(1);
            v5 = v4.mul(varg4);
            v6 = v5.add(varg1);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

            // 0x985a78d3 = setStone(address,bytes32,uint256)
            v7 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x985a78d3), fortressStorage, varg6, v6).gas(msg.gas - 710);
            require(bool(v7));
        }
        if (varg5 != woodHash) {
            return ;
        } else {
            v8 = varg3.add(1);
            v9 = v8.mul(varg4);
            v10 = v9.add(varg0);
            require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

            // 0xa04e8cb9 = setWood(address,bytes32,uint256)
            v11 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xa04e8cb9), fortressStorage, varg6, v10).gas(msg.gas - 710);
            require(bool(v11));
            return ;
        }
    }

    function unknown_0x2a52(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) private { 
        v0, v1, v2 = unknown_0x1393(varg6);
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
        // 0x1253a59c = setGold(address,bytes32,uint256)
        v13 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1253a59c), fortressStorage, varg7, v12).gas(msg.gas - 710);
        require(bool(v13));
        v14 = v6.sub(varg2);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        // 0x985a78d3 = setStone(address,bytes32,uint256)
        v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x985a78d3), fortressStorage, varg7, v14).gas(msg.gas - 710);
        require(bool(v15));
        v16 = v7.sub(varg1);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        // 0xa04e8cb9 = setWood(address,bytes32,uint256)
        v17 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xa04e8cb9), fortressStorage, varg7, v16).gas(msg.gas - 710);
        require(bool(v17));
        v18 = v4.add(varg0);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        // 0x56c1c099 = setTroups(address,bytes32,bytes32,uint256)
        v19 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x56c1c099), fortressStorage, varg7, varg6, v18).gas(msg.gas - 710);
        require(bool(v19));
        return ;
    }

    function getFortressCount() public view returns (uint256) {
        assembly {
            // ------------------------------------------------------------------
            // 1) Hardcoded proxy address
            // ------------------------------------------------------------------
            let proxy := 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a

            // require(extcodesize(proxy) > 0)
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            // ------------------------------------------------------------------
            // 2) Load fortressStorage from slot 0x2 and mask to 160 bits
            //    (matches the EXP/SUB/AND pattern)
            // ------------------------------------------------------------------
            // mask = (2**160 - 1)
            let mask := sub(exp(2, 0xa0), 1)
            let storageAddr := and(sload(0x2), mask)

            // ------------------------------------------------------------------
            // 3) Build calldata at free memory ptr:
            //    [0..3]   = selector 0x3f0a6f3d (shifted into top 4 bytes)
            //    [4..35]  = fortressStorage (left-padded to 32 bytes)
            //    total calldata size = 0x24
            // ------------------------------------------------------------------
            let ptr := mload(0x40)

            // selector in first 4 bytes:
            // mstore(ptr, 0x3f0a6f3d << 224)
            // solc-0.4.x often does this as MUL(selector, EXP(2,224))
            // 0x3f0a6f3d = getFortressCount(address)
            mstore(ptr, mul(0x3f0a6f3d, exp(2, 224)))

            // arg0 at ptr+4 (address masked)
            mstore(add(ptr, 4), storageAddr)

            // ------------------------------------------------------------------
            // 4) delegatecall(gas - 710, proxy, ptr, 0x24, ptr, 0x20)
            //    Your trace shows PUSH2 0x2c6 then GAS SUB, so use 0x2c6.
            // ------------------------------------------------------------------
            if iszero(delegatecall(sub(gas, 0x2c6), proxy, ptr, 0x24, ptr, 0x20)) {
                revert(0, 0)
            }

            // ------------------------------------------------------------------
            // 5) Return the 32-byte uint256 from ptr (matches common return stub)
            // ------------------------------------------------------------------
            return(ptr, 0x20)
        }
    }

    function unknown_0x2d54(uint256 varg0, uint256 varg1, uint256 varg2) private { 
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        
        // 0xf28c3ee3 = setBuildingTimeout(address,bytes32,bytes32,uint256)
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf28c3ee3), fortressStorage, varg2, varg1, varg0 * 3600 + block.timestamp).gas(msg.gas - 710);
        require(bool(v0));
        return ;
    }

    function getTroupHash(uint256 _index) public view returns (bytes32) {
        address storageAddr = troupStorage;

        assembly {
            let proxy := 0x902904b1833def4aef05b99cea93cc3383cd2d4a

            // require(extcodesize(proxy) > 0)
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            // selector = 0xed05582b (left-shifted 224 bits)
            // 0xed05582b = getHash(address,uint256)
            mstore(ptr, mul(0xed05582b, exp(2, 224)))

            // arg0: troupStorage (masked to 160 bits)
            mstore(add(ptr, 4), and(storageAddr, 0xffffffffffffffffffffffffffffffffffffffff))

            // arg1: _index
            mstore(add(ptr, 36), _index)

            // delegatecall(gas - 710, proxy, ptr, 0x44, ptr, 0x20)
            let ok := delegatecall(sub(gas, 710), proxy, ptr, 0x44, ptr, 0x20)
            if iszero(ok) { revert(0, 0) }

            // load returned bytes32 directly
            return(ptr, 0x20)
        }
    }

    function createBuilding(bytes16 _name, uint256 _action, uint256 _actionRate, bytes32 _actionValue, uint256 _actionTimeout, uint256 _gold, uint256 _wood, uint256 _stone) public onlyOwner {
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));

        // 0xf481d125 = createBuilding(address,bytes32,bytes16,uint256,uint256,bytes32,uint256,uint256,uint256,uint256)
        v0 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(
            uint32(0xf481d125), 
            buildingStorage,
            keccak256(msg.sender, _name, nonce), 
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
        LogBuildingCreated(keccak256(msg.sender, _name, nonce));
        nonce += 1;
    }

    function build(bytes32 _fortressHash, bytes32 _buildingHash) public whenNotPaused {
        unknown_0x26af(_fortressHash);
        v0, v1, v2 = unknown_0x1749(_fortressHash);
        v3, v4, v5 = unknown_0x14f4(_buildingHash);
        v6, v7 = unknown_0x1a67(_buildingHash, _fortressHash);
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

        // 0x7b2be003 = build(address,bytes32,bytes32,uint256,uint256,uint256,uint256)
        v19 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x7b2be003), fortressStorage, _fortressHash, _buildingHash, v16, v17, v18, v8).gas(msg.gas - 710);
        require(bool(v19));
        LogBuild(_fortressHash, _buildingHash);
    }

    function getFortressesAvailable() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0x1777d529 = getFortressesAvailable(address)
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1777d529), fortressStorage).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getTroupIndexLength() public view returns (uint256) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));

        // 0xf5807181 = getIndexLength(address)
        v0, /* uint256 */ v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xf5807181), troupStorage).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function createFortress(bytes16 _name) public payable whenNotPaused {
        require(msg.value >= 10 ** 16);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0xbd1fb981 = createFortress(address,bytes32,bytes16,int256,int256,uint256,uint256,uint256,uint256,address)
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xbd1fb981), fortressStorage, keccak256(msg.sender, _name, nonce), _name, x, y, 200, 400, 500, 0, msg.sender).gas(msg.gas - 710);
        require(bool(v0));
        v1 = v2 = x == y;
        if (x != y) {
            v1 = v3 = x < 0;
            if (v3) {
                v1 = v4 = x == 0 - y;
            }
        }
        if (!v1) {
            v1 = v5 = x > 0;
            if (v5) {
                v1 = v6 = x == 1 - y;
            }
        }
        if (v1) {
            dx = 0 - dy;
            dy = dx;
        }
        x += dx;
        y += dy;
        LogFortressCreated(_name, keccak256(msg.sender, _name, nonce), msg.sender, x, y);
        nonce += 1;
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

        (wood, stone, gold) = unknown_0x1393(uint256(_troupHash));

        return (gold, stone, wood);
    }

    function getHashFromIndex(address _user, uint256 _index) public view returns (bytes32) { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0x54c711ba = getHashFromIndex(address,address,uint256)
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x54c711ba), fortressStorage, _user, _index).gas(msg.gas - 710);
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

        (wood, stone, gold) = unknown_0x14f4(uint256(_buildingHash));
        
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
        address storageAddr = troupStorage;

        bool success;
        bytes16 name;
        uint256 life;
        uint256 strength;
        uint256 intelligence;
        uint256 dexterity;

        assembly {
            if iszero(extcodesize(proxy)) { revert(0, 0) }

            let ptr := mload(0x40)

            // 0x2a33569e = getTroup(address,bytes32)
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

    function transferFortress(bytes32 _fortressHash, address _newOwner) public whenNotPaused {
        unknown_0x26af(_fortressHash);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0xb844ad67 = transfer(address,bytes32,address)
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xb844ad67), fortressStorage, _fortressHash, _newOwner).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getUserAuctionsLength(address _user) public returns (uint256) { 
        return userAuctions[_user].length;
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

        (wood, stone, gold) = unknown_0x1749(uint256(_fortressHash));
        
        return (gold, stone, wood);
    }

    function withdraw(bytes32 _fortressHash) public whenNotPaused {
        require(block.timestamp <= auctionEnd[_fortressHash]);
        require(highestBidder[_fortressHash] != msg.sender);

        bytes32 key = keccak256(_fortressHash, msg.sender);
        
        // cache amount first (matches Tenderly showing the SLOAD before SSTORE)
        uint256 amount = balanceAuction[key];

        // clear pending balance (even if it's already 0)
        balanceAuction[key] = 0;
        balances[msg.sender] = balanceAuction[key].sub(balances[msg.sender]);
        totalBalance = balanceAuction[key].sub(totalBalance);

        require(msg.sender.call.value(amount).gas(2300)());
    }

    function createTroup(bytes16 _name, uint256 _life, uint256 _strength, uint256 _intelligence, uint256 _dexterity, uint256 _gold, uint256 _wood, uint256 _stone) public onlyOwner {
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));

        // 0x93fdc929 = createTroup(address,bytes32,bytes16,uint256,uint256,uint256,uint256,uint256,uint256,uint256)
        v0 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0x93fdc929), troupStorage, keccak256(msg.sender, _name, nonce), _name, _life, _strength, _intelligence, _dexterity, _gold, _wood, _stone).gas(msg.gas - 710);
        require(bool(v0));
        LogTroupCreated(keccak256(msg.sender, _name, nonce));
        nonce += 1;
    }

    function getFortressBuilding(bytes32 _fortressHash, bytes32 _buildingHash) 
        public 
        view 
        returns (
            uint256 _level, 
            uint256 _timeout
        )
    { 
        (uint256 timeout, uint256 level) = unknown_0x1a67(uint256(_buildingHash), uint256(_fortressHash));
        return (level, timeout);
    }

    function startMinting() public onlyOwner {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0xd87f3856 = startMinting(address)
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xd87f3856), fortressStorage).gas(msg.gas - 710);
        require(bool(v0));
    }

    function withdrawExcess(address _withdraw) public onlyOwner {
        v0 = totalBalance.sub((address(this)).balance);
        v1 = _withdraw.call().value(v0).gas(!v0 * 2300);
        require(bool(v1));
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
        address storageAddr = fortressStorage;

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
            // 0x0d041e57 = getFortress(address,bytes32)
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

    function getFortressTroups(bytes32 _fortressHash, bytes32 _troupHash) 
        public
        view
        returns (_amount uint256)
    { 
        v0 = unknown_0x1d04(uint256(_troupHash), uint256(_fortressHash));
        return v0;
    }

    function getAuctionAmount(bytes32 _fortressHash, address _user) 
        public
        view
        returns (uint256)
    { 
        return balanceAuction[keccak256(_fortressHash, _user)];
    }

    function bidAuction(bytes32 _fortressHash) 
        public 
        payable 
        whenNotPaused 
    {
        require(block.timestamp < auctionEnd[_fortressHash]);
        v0 = AUCTION_DURATION.sub(auctionEnd[_fortressHash]);
        require(block.timestamp > v0);
        assert(bool(100));
        v1 = uint256(1).mul(msg.value / 100);
        v2 = v1.sub(msg.value);
        v3 = keccak256(_fortressHash, msg.sender);
        if (!bool(balanceAuction[v3])) {
            userAuctions[msg.sender].length = userAuctions[msg.sender].length + 1;
            if (!userAuctions[msg.sender].length <= userAuctions[msg.sender].length + 1) {
                v4 = v5 = userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
                while (keccak256(keccak256(msg.sender, 12)) + userAuctions[msg.sender].length > v4) {
                    STORAGE[v4] = 0;
                    v4 += 1;
                }
            }
            userAuctions[msg.sender][userAuctions[msg.sender].length] = _fortressHash;
        }
        v6 = v2.add(balanceAuction[v3]);
        balanceAuction[v3] = v6;
        v7 = v2.add(balances[msg.sender]);
        balances[msg.sender] = v7;
        v8 = v2.add(totalBalance);
        totalBalance = v8;
        v9 = (10 ** 16).add(highestBid[_fortressHash]);
        if (balanceAuction[v3] >= v9) {
            highestBid[_fortressHash] = balanceAuction[v3];
            highestBidder[_fortressHash] = msg.sender;
        }
    }

    function getBuildingHash(uint256 _index) 
        public
        view
        returns (bytes32)
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.getHash(buildingStorage, _index).gas(msg.gas - 710);
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

        // 0xf5807181 = getIndexLength(address)
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xf5807181), buildingStorage).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getAuctionsLength() 
        public 
        view
        returns (uint256)
    { 
        return auctions.length;
    }

    function buildingAction(bytes32 _fortressHash, bytes32 _buildingHash) 
        public 
        whenNotPaused
    {
        unknown_0x26af(uint256(_fortressHash));
        v0, v1 = unknown_0x1a67(uint256(_buildingHash), uint256(_fortressHash));
        require(block.timestamp > v0);
        v2, v3, v4, v5, v6 = _getBuildingFromProxy(uint256(_buildingHash));
        v7, v8, v9 = unknown_0x1749(uint256(_fortressHash));
        if (v5 == 1) {
            unknown_0x2811(v7, v8, v9, v1, v4, v3, uint256(_fortressHash));
        }
        if (2 == v5) {
            v10 = unknown_0x1d04(v3, uint256(_fortressHash));
            unknown_0x2a52(v10, v7, v8, v9, v1, v4, v3, uint256(_fortressHash));
        }
        unknown_0x2d54(v2, uint256(_buildingHash), uint256(_fortressHash));
        LogBuildingAction(_fortressHash, _buildingHash);
    }

    function upgradeGame(address _newContract) 
        public
        onlyOwner
    {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.upgrade(fortressStorage, _newContract).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.upgrade(buildingStorage, _newContract).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v2 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.upgrade(troupStorage, _newContract).gas(msg.gas - 710);
        require(bool(v2));
    }

    function startAuction(bytes32 _fortressHash /* fortress hash */) 
        public 
        whenNotPaused 
    {
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(fortressStorage, _fortressHash).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0xf1ed0c6 = setOwner(address,bytes32,address)
        v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), fortressStorage, _fortressHash, address(this)).gas(msg.gas - 710);
        require(bool(v2));
        highestBidder[_fortressHash] = msg.sender;
        highestBid[_fortressHash] = 0;
        auctionOwner[_fortressHash] = msg.sender;
        auctionEnd[_fortressHash] = block.timestamp + AUCTION_DURATION;
        userAuctions[msg.sender].length = userAuctions[msg.sender].length + 1;
        if (!userAuctions[msg.sender].length <= userAuctions[msg.sender].length + 1) {
            v3 = v4 = userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
            while (keccak256(keccak256(msg.sender, 12)) + userAuctions[msg.sender].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        userAuctions[msg.sender][userAuctions[msg.sender].length] = _fortressHash;
        auctions.length = auctions.length + 1;
        if (!auctions.length <= auctions.length + 1) {
            v5 = v6 = auctions.length + 1 + keccak256(16);
            while (keccak256(16) + auctions.length > v5) {
                STORAGE[v5] = 0;
                v5 += 1;
            }
        }
        auctions[auctions.length] = _fortressHash;
    }

    function getIndexLength(address _user) 
        public
        view
        returns (uint256)
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));

        // 0x6dff11 = getIndexLength(address,address)
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x6dff11), fortressStorage, address(_user)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }
}