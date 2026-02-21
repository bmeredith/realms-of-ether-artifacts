pragma solidity ^0.4.26;

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

    function 0x12cc(uint256 varg0) private { 
        MEM[160 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0x9d3bd2e4), stor_3_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v5, v4, v3, v2, v1;
    }

    function 0x1393(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xfc85a0d2), stor_4_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function 0x14f4(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xfc85a0d2), stor_3_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function 0x1749(uint256 varg0) private { 
        MEM[96 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2, /* uint256 */ v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x58e9eb78), stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v3, v2, v1;
    }

    function 0x1a67(uint256 varg0, uint256 varg1) private { 
        MEM[64 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1, /* uint256 */ v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x4e49bbe1), stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v2, v1;
    }

    function 0x1d04(uint256 varg0, uint256 varg1) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xfd1fd5ff), stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function fallback() public payable { 
        revert();
    }

    function endAuction(bytes32 auctionId) public whenNotPaused {
        require(mapping_8[auctionId] <= block.timestamp);
        require(_highestBidder[auctionId] == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), stor_2_0_19, auctionId, msg.sender).gas(msg.gas - 710);
        require(bool(v0));
        v1 = mapping_a[auctionId].sub(_balances[msg.sender]);
        _balances[msg.sender] = v1;
        mapping_d[keccak256(auctionId, msg.sender)] = 0;
        v2 = mapping_a[auctionId].add(mapping_d[keccak256(auctionId, mapping_9[auctionId])]);
        mapping_d[keccak256(auctionId, mapping_9[auctionId])] = v2;
        v3 = mapping_a[auctionId].add(_balances[mapping_9[auctionId]]);
        _balances[mapping_9[auctionId]] = v3;
    }

    function 0x26af(uint256 varg0) private { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        return ;
    }

    function fortressStorage() public { 
        return stor_2_0_19;
    }

    function 0x2811(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6) private { 
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

    function balanceAuction(bytes32 varg0) public { 
        return mapping_d[varg0];
    }

    function 0x2a52(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) private { 
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

    function getFortressCount() public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x3f0a6f3d), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function 0x2d54(uint256 varg0, uint256 varg1, uint256 varg2) private { 
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf28c3ee3), stor_2_0_19, varg2, varg1, varg0 * 3600 + block.timestamp).gas(msg.gas - 710);
        require(bool(v0));
        return ;
    }

    function getTroupHash(uint256 varg0) public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.getHash(stor_4_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function createBuilding(bytes16 varg0, uint256 varg1, uint256 varg2, bytes32 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public onlyOwner {
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xf481d125), stor_3_0_19, keccak256(msg.sender, varg0, stor_1), varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7).gas(msg.gas - 710);
        require(bool(v0));
        emit 0xc419dae1c5cabdd3bc2861f0a8137963291d13cf042875f96fd1a297396c4a6f(keccak256(msg.sender, varg0, stor_1));
        stor_1 += 1;
    }

    function balances(address varg0) public { 
        return _balances[varg0];
    }

    function build(bytes32 name, bytes32 symbol) public whenNotPaused {
        0x26af(name);
        v0, v1, v2 = 0x1749(name);
        v3, v4, v5 = 0x14f4(symbol);
        v6, v7 = 0x1a67(symbol, name);
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
        v19 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x7b2be003), stor_2_0_19, name, symbol, v16, v17, v18, v8).gas(msg.gas - 710);
        require(bool(v19));
        emit 0x9303befd891bc5843e6997e792f1908586d704459200b41377769d33f733fef9(name, symbol);
    }

    function troupStorage() public { 
        return stor_4_0_19;
    }

    function getFortressesAvailable() public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x1777d529), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getTroupIndexLength() public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* uint256 */ v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0xf5807181), stor_4_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function createFortress(bytes16 varg0) public payable whenNotPaused {
        require(msg.value >= 10 ** 16);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xbd1fb981), stor_2_0_19, keccak256(msg.sender, varg0, stor_1), varg0, stor_11, stor_12, 200, 400, 500, 0, msg.sender).gas(msg.gas - 710);
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
        emit 0x39152486560cc8ff27042032d9bb477500eca5162f3415779350075bcfc05c8e(varg0, keccak256(msg.sender, varg0, stor_1), msg.sender, stor_11, stor_12);
        stor_1 += 1;
    }

    function auctions(uint256 varg0) public { 
        assert(varg0 < _getAuctionsLength.length);
        return _getAuctionsLength[varg0];
    }

    function highestBid(bytes32 varg0) public { 
        return mapping_a[varg0];
    }

    function getBuilding(bytes32 buildingNameHash) public { 
        v0, v1, v2, v3, v4 = 0x12cc(buildingNameHash);
        return bytes16(v4), v3, v2, v1, v0;
    }

    function getTroupCosts(bytes32 varg0) public { 
        v0, v1, v2 = 0x1393(varg0);
        return v2, v1, v0;
    }

    function auctionEnd(bytes32 varg0) public { 
        return mapping_8[varg0];
    }

    function getHashFromIndex(address varg0, uint256 varg1) public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x54c711ba), stor_2_0_19, varg0, varg1).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuildingCosts(uint256 varg0) public { 
        v0, v1, v2 = 0x14f4(varg0);
        return v2, v1, v0;
    }

    function getTroup(bytes32 varg0) public { 
        MEM[160 + MEM[64]] = 0;
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0, /* bytes16 */ v1, /* uint256 */ v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0x2a33569e), stor_4_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return bytes16(v1), v2, v3, v4, v5;
    }

    function stoneHash() public { 
        return stor_7;
    }

    function transferFortress(bytes32 varg0, address varg1) public whenNotPaused {
        0x26af(varg0);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xb844ad67), stor_2_0_19, varg0, varg1).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getUserAuctionsLength(address varg0) public { 
        return _userAuctions[varg0].length;
    }

    function goldHash() public { 
        return stor_5;
    }

    function getResources(bytes32 varg0) public { 
        v0, v1, v2 = 0x1749(varg0);
        return v2, v1, v0;
    }

    function withdraw(bytes32 fortressHash) public whenNotPaused {
        require(mapping_8[fortressHash] <= block.timestamp);
        require(_highestBidder[fortressHash] != msg.sender);

        bytes32 key = keccak256(fortressHash, msg.sender);
        
        // cache amount first (matches Tenderly showing the SLOAD before SSTORE)
        uint256 amount = mapping_d[key];

        // clear pending balance (even if it's already 0)
        mapping_d[key] = 0;
        _balances[msg.sender] = mapping_d[key].sub(_balances[msg.sender]);
        _totalBalance = mapping_d[key].sub(_totalBalance);

        require(msg.sender.call.value(amount).gas(2300)());
    }

    function createTroup(bytes16 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public onlyOwner {
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v0 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(uint32(0x93fdc929), stor_4_0_19, keccak256(msg.sender, varg0, stor_1), varg0, varg1, varg2, varg3, varg4, varg5, varg6, varg7).gas(msg.gas - 710);
        require(bool(v0));
        emit 0xa543a0fdbe4c677f8ac450772f98d34ced6e7ed99d9876cd73c0e132d35f791c(keccak256(msg.sender, varg0, stor_1));
        stor_1 += 1;
    }

    function getFortressBuilding(bytes32 varg0, bytes32 varg1) public { 
        v0, v1 = 0x1a67(varg1, varg0);
        return v1, v0;
    }

    function startMinting() public onlyOwner {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xd87f3856), stor_2_0_19).gas(msg.gas - 710);
        require(bool(v0));
    }

    function woodHash() public { 
        return stor_6;
    }

    function totalBalance() public { 
        return _totalBalance;
    }

    function withdrawExcess(address _receiver) public onlyOwner {
        v0 = _totalBalance.sub((address(this)).balance);
        v1 = _receiver.call().value(v0).gas(!v0 * 2300);
        require(bool(v1));
    }

    function userAuctions(address varg0, uint256 varg1) public { 
        assert(varg1 < _userAuctions[varg0].length);
        return _userAuctions[varg0][varg1];
    }

    function highestBidder(bytes32 hash) public { 
        return _highestBidder[hash];
    }

    function getFortress(bytes32 varg0) public { 
        MEM[160 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* bytes16 */ v1, /* address */ v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xd041e57), stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return bytes16(v1), address(v2), v3, v4, v5;
    }

    function auctionOwner(bytes32 varg0) public { 
        return mapping_9[varg0];
    }

    function getFortressTroups(bytes32 varg0, bytes32 varg1) public { 
        v0 = 0x1d04(varg1, varg0);
        return v0;
    }

    function getAuctionAmount(bytes32 varg0, address varg1) public { 
        return mapping_d[keccak256(varg0, varg1)];
    }

    function bidAuction(bytes32 varg0) public payable whenNotPaused {
        require(block.timestamp < mapping_8[varg0]);
        v0 = AUCTION_DURATION.sub(mapping_8[varg0]);
        require(block.timestamp > v0);
        assert(bool(100));
        v1 = uint256(1).mul(msg.value / 100);
        v2 = v1.sub(msg.value);
        v3 = keccak256(varg0, msg.sender);
        if (!bool(mapping_d[v3])) {
            _userAuctions[msg.sender].length = _userAuctions[msg.sender].length + 1;
            if (!_userAuctions[msg.sender].length <= _userAuctions[msg.sender].length + 1) {
                v4 = v5 = _userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
                while (keccak256(keccak256(msg.sender, 12)) + _userAuctions[msg.sender].length > v4) {
                    STORAGE[v4] = 0;
                    v4 += 1;
                }
            }
            _userAuctions[msg.sender][_userAuctions[msg.sender].length] = varg0;
        }
        v6 = v2.add(mapping_d[v3]);
        mapping_d[v3] = v6;
        v7 = v2.add(_balances[msg.sender]);
        _balances[msg.sender] = v7;
        v8 = v2.add(_totalBalance);
        _totalBalance = v8;
        v9 = (10 ** 16).add(mapping_a[varg0]);
        if (mapping_d[v3] >= v9) {
            mapping_a[varg0] = mapping_d[v3];
            _highestBidder[varg0] = msg.sender;
        }
    }

    function getBuildingHash(uint256 varg0) public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.getHash(stor_3_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuildingIndexLength() public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v0, /* uint256 */ v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(uint32(0xf5807181), stor_3_0_19).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getAuctionsLength() public { 
        return _getAuctionsLength.length;
    }

    function buildingAction(bytes32 varg0, bytes32 varg1) public whenNotPaused {
        0x26af(varg0);
        v0, v1 = 0x1a67(varg1, varg0);
        require(block.timestamp > v0);
        v2, v3, v4, v5, v6 = 0x12cc(varg1);
        v7, v8, v9 = 0x1749(varg0);
        if (v5 == 1) {
            0x2811(v7, v8, v9, v1, v4, v3, varg0);
        }
        if (2 == v5) {
            v10 = 0x1d04(v3, varg0);
            0x2a52(v10, v7, v8, v9, v1, v4, v3, varg0);
        }
        0x2d54(v2, varg1, varg0);
        emit 0x9afc6e84262b245e3a80ef387f2b777dfe649ffc2eed92f9375b893a5539b0ca(varg0, varg1);
    }

    function upgradeGame(address varg0) public onlyOwner {
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.upgrade(stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size));
        v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.upgrade(stor_3_0_19, varg0).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size));
        v2 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.upgrade(stor_4_0_19, varg0).gas(msg.gas - 710);
        require(bool(v2));
    }

    function buildingStorage() public { 
        return stor_3_0_19;
    }

    function startAuction(bytes32 loanId) public whenNotPaused {
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* address */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.getOwner(stor_2_0_19, loanId).gas(msg.gas - 710);
        require(bool(v0));
        require(address(v1) == msg.sender);
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0xf1ed0c6), stor_2_0_19, loanId, address(this)).gas(msg.gas - 710);
        require(bool(v2));
        _highestBidder[loanId] = msg.sender;
        mapping_a[loanId] = 0;
        mapping_9[loanId] = msg.sender;
        mapping_8[loanId] = block.timestamp + AUCTION_DURATION;
        _userAuctions[msg.sender].length = _userAuctions[msg.sender].length + 1;
        if (!_userAuctions[msg.sender].length <= _userAuctions[msg.sender].length + 1) {
            v3 = v4 = _userAuctions[msg.sender].length + 1 + keccak256(keccak256(msg.sender, 12));
            while (keccak256(keccak256(msg.sender, 12)) + _userAuctions[msg.sender].length > v3) {
                STORAGE[v3] = 0;
                v3 += 1;
            }
        }
        _userAuctions[msg.sender][_userAuctions[msg.sender].length] = loanId;
        _getAuctionsLength.length = _getAuctionsLength.length + 1;
        if (!_getAuctionsLength.length <= _getAuctionsLength.length + 1) {
            v5 = v6 = _getAuctionsLength.length + 1 + keccak256(16);
            while (keccak256(16) + _getAuctionsLength.length > v5) {
                STORAGE[v5] = 0;
                v5 += 1;
            }
        }
        _getAuctionsLength[_getAuctionsLength.length] = loanId;
    }

    function getIndexLength(address varg0) public { 
        MEM[32 + MEM[64]] = 0;
        require(bool(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size));
        v0, /* uint256 */ v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(uint32(0x6dff11), stor_2_0_19, varg0).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }
}