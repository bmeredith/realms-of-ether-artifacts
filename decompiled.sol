// Decompiled by library.dedaub.com
// 2022.12.03 00:57 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_1; // STORAGE[0x1]
uint256 stor_5; // STORAGE[0x5]
uint256 stor_6; // STORAGE[0x6]
uint256 stor_7; // STORAGE[0x7]
mapping (uint256 => [uint256]) owner_8; // STORAGE[0x8]
mapping (uint256 => [uint256]) owner_9; // STORAGE[0x9]
mapping (uint256 => [uint256]) owner_a; // STORAGE[0xa]
mapping (uint256 => [uint256]) _highestBidder; // STORAGE[0xb]
mapping (uint256 => [uint256]) owner_c; // STORAGE[0xc]
mapping (uint256 => [uint256]) owner_d; // STORAGE[0xd]
mapping (uint256 => [uint256]) _balances; // STORAGE[0xe]
uint256 _totalBalance; // STORAGE[0xf]
uint256[] _getAuctionsLength; // STORAGE[0x10]
uint256 stor_11; // STORAGE[0x11]
uint256 stor_12; // STORAGE[0x12]
uint256 stor_13; // STORAGE[0x13]
uint256 stor_14; // STORAGE[0x14]
uint256 _owner; // STORAGE[0x0] bytes 0 to 19
uint256 stor_2_0_19; // STORAGE[0x2] bytes 0 to 19
uint256 _paused; // STORAGE[0x0] bytes 20 to 20
uint256 stor_3_0_19; // STORAGE[0x3] bytes 0 to 19
uint256 stor_4_0_19; // STORAGE[0x4] bytes 0 to 19

// Events
Unpause();
Pause();
OwnershipTransferred(address, address);

function 0x12cc(uint256 varg0) private { 
    MEM[160 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1, v2, v3, v4, v5 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0x9d3bd2e4, stor_3_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return MEM[128 + MEM[64]], MEM[96 + MEM[64]], MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1393(uint256 varg0) private { 
    MEM[96 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1, v2, v3 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xfc85a0d2, stor_4_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x14f4(uint256 varg0) private { 
    MEM[96 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1, v2, v3 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xfc85a0d2, stor_3_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1749(uint256 varg0) private { 
    MEM[96 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1, v2, v3 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x58e9eb78, stor_2_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return MEM[64 + MEM[64]], MEM[32 + MEM[64]], MEM[MEM[64]];
}

function 0x1a67(uint256 varg0, uint256 varg1) private { 
    MEM[64 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1, v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x4e49bbe1, stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
    require(v0);
    return v2, v1;
}

function 0x1d04(uint256 varg0, uint256 varg1) private { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xfd1fd5ff, stor_2_0_19, varg1, varg0).gas(msg.gas - 710);
    require(v0);
    return MEM[MEM[64]];
}

function () public payable { 
    revert();
}

function endAuction(bytes32 varg0) public nonPayable { 
    require(!_paused);
    require(owner_8[varg0] <= block.timestamp);
    require(address(_highestBidder[varg0]) == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf1ed0c6, stor_2_0_19, varg0, msg.sender).gas(msg.gas - 710);
    require(v0);
    assert(owner_a[varg0] <= _balances[msg.sender]);
    _balances[msg.sender] = _balances[msg.sender] - owner_a[varg0];
    _balances[keccak256(varg0, msg.sender)] = 0;
    v1 = keccak256(varg0, address(owner_9[keccak256(varg0, msg.sender)]));
    assert(owner_9[keccak256(varg0, msg.sender)] + owner_9[v1] >= owner_9[v1]);
    owner_d[v1] = owner_9[keccak256(varg0, msg.sender)] + owner_9[v1];
    assert(owner_a[v1] + owner_9[address(owner_9[v1])] >= owner_9[address(owner_9[v1])]);
    owner_9[address(owner_9[varg0])] = owner_a[v1] + owner_9[address(owner_9[v1])];
}

function 0x26af(uint256 varg0) private { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x69c5b2b8, stor_2_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    require(address(v1) == msg.sender);
    return ;
}

function 0x0258a643() public nonPayable { 
    return stor_2_0_19;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    if (varg1) {
        v0 = varg0 * varg1;
        assert(varg1);
        assert(v0 / varg1 == varg0);
        return v0;
    } else {
        return 0;
    }
}

function 0x093556c9(uint256 varg0) public nonPayable { 
    return owner_d[varg0];
}

function 0x10cfcf0c() public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x3f0a6f3d, stor_2_0_19).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0x245454b5(uint256 varg0) public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.getHash(stor_4_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0x2516930f(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public nonPayable { 
    require(_owner == msg.sender);
    v0 = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (varg0 & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xf481d125, stor_3_0_19, v0, varg0 & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, varg1, varg2, varg3, varg4, varg5, varg6, varg7).gas(msg.gas - 710);
    require(v1);
    emit 0xc419dae1c5cabdd3bc2861f0a8137963291d13cf042875f96fd1a297396c4a6f(v0);
    stor_1 += 1;
}

function balances(address varg0) public nonPayable { 
    return _balances[varg0];
}

function 0x30b654f8(uint256 varg0, uint256 varg1) public nonPayable { 
    require(!_paused);
    0x26af(varg0);
    v0, v1, v2 = 0x1749(varg0);
    v3, v4, v5 = 0x14f4(varg1);
    v6, v7 = 0x1a67(varg1, varg0);
    assert(1 + v7 >= v7);
    v8 = _SafeMul(1 + v7, v5);
    v9 = _SafeMul(1 + v7, v4);
    v10 = _SafeMul(1 + v7, v3);
    v11 = v12 = v2 >= v8;
    if (v12) {
        v11 = v13 = v1 >= v9;
    }
    if (v11) {
        v11 = v14 = v0 >= v10;
    }
    require(v11);
    assert(v8 <= v2);
    assert(v9 <= v1);
    assert(v10 <= v0);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x7b2be003, stor_2_0_19, varg0, varg1, v2 - v8, v1 - v9, v0 - v10, 1 + v7).gas(msg.gas - 710);
    require(v15);
    emit 0x9303befd891bc5843e6997e792f1908586d704459200b41377769d33f733fef9(varg0, varg1);
}

function unpause() public nonPayable { 
    require(_owner == msg.sender);
    require(_paused);
    _paused = 0;
    emit Unpause();
}

function 0x40d7f8c0() public nonPayable { 
    return stor_4_0_19;
}

function 0x468c7804() public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1777d529, stor_2_0_19).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0x48d79c6f() public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0xf5807181, stor_4_0_19).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0x5096ec53(uint256 varg0) public payable { 
    require(!_paused);
    require(msg.value >= 0x2386f26fc10000);
    v0 = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (varg0 & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xbd1fb981, stor_2_0_19, v0, varg0 & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, stor_11, stor_12, 200, 400, 500, 0, msg.sender).gas(msg.gas - 710);
    require(v1);
    v2 = v3 = stor_11 == stor_12;
    if (stor_11 != stor_12) {
        v2 = v4 = stor_11 < 0;
        if (v4) {
            v2 = v5 = stor_11 == 0 - stor_12;
        }
    }
    if (!v2) {
        v2 = v6 = stor_11 > 0;
        if (v6) {
            v2 = v7 = stor_11 == 1 - stor_12;
        }
    }
    if (v2) {
        stor_13 = 0 - stor_14;
        stor_14 = stor_13;
    }
    stor_11 += stor_13;
    stor_12 += stor_14;
    emit 0x39152486560cc8ff27042032d9bb477500eca5162f3415779350075bcfc05c8e(varg0 & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, v0, msg.sender, stor_11, stor_12);
    stor_1 += 1;
}

function auctions(uint256 varg0) public nonPayable { 
    assert(varg0 < _getAuctionsLength.length);
    return _getAuctionsLength[varg0];
}

function paused() public nonPayable { 
    return _paused;
}

function 0x61508bfd(uint256 varg0) public nonPayable { 
    return owner_a[varg0];
}

function 0x66760ce6(uint256 varg0) public nonPayable { 
    v0, v1, v2, v3, v4 = 0x12cc(varg0);
    return v4 & ~0xffffffffffffffffffffffffffffffff, v3, v2, v1, v0;
}

function 0x66cfc337(uint256 varg0) public nonPayable { 
    v0, v1, v2 = 0x1393(varg0);
    return v2, v1, v0;
}

function 0x7621bd09(uint256 varg0) public nonPayable { 
    return owner_8[varg0];
}

function 0x78a11bf0(uint256 varg0, uint256 varg1) public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x54c711ba, stor_2_0_19, address(varg0), varg1).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0x7bbe0176(uint256 varg0) public nonPayable { 
    v0, v1, v2 = 0x14f4(varg0);
    return v2, v1, v0;
}

function 0x7e403f26(uint256 varg0) public nonPayable { 
    MEM[160 + MEM[64]] = 0;
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v0, v1, v2, v3, v4, v5 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0x2a33569e, stor_4_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return v1 & ~0xffffffffffffffffffffffffffffffff, v2, v3, v4, v5;
}

function 0x7f1c5886() public nonPayable { 
    return stor_7;
}

function 0x8063a94b(uint256 varg0, uint256 varg1) public nonPayable { 
    require(!_paused);
    0x26af(varg0);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xb844ad67, stor_2_0_19, varg0, address(varg1)).gas(msg.gas - 710);
    require(v0);
}

function 0x82768573(uint256 varg0) public nonPayable { 
    return owner_c[address(varg0)];
}

function pause() public nonPayable { 
    require(_owner == msg.sender);
    require(!_paused);
    _paused = 1;
    emit Pause();
}

function 0x8764d2e2() public nonPayable { 
    return stor_5;
}

function 0x8ca25ab4(uint256 varg0) public nonPayable { 
    v0, v1, v2 = 0x1749(varg0);
    return v2, v1, v0;
}

function owner() public nonPayable { 
    return _owner;
}

function withdraw(bytes32 varg0) public nonPayable { 
    require(!_paused);
    require(owner_8[varg0] <= block.timestamp);
    require(address(_highestBidder[varg0]) != msg.sender);
    owner_d[keccak256(varg0, msg.sender)] = 0;
    assert(owner_d[keccak256(varg0, msg.sender)] <= _balances[msg.sender]);
    _balances[msg.sender] = _balances[msg.sender] - owner_d[keccak256(varg0, msg.sender)];
    assert(owner_d[keccak256(varg0, msg.sender)] <= _totalBalance);
    _totalBalance = _totalBalance - owner_d[keccak256(varg0, msg.sender)];
    v0 = msg.sender.call().value(owner_d[keccak256(varg0, msg.sender)]).gas(2300 * !owner_d[keccak256(varg0, msg.sender)]);
    require(v0);
}

function 0x974f1e9e(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5, uint256 varg6, uint256 varg7) public nonPayable { 
    require(_owner == msg.sender);
    v0 = keccak256(msg.sender, ~0xffffffffffffffffffffffffffffffff & (varg0 & ~0xffffffffffffffffffffffffffffffff), stor_1);
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v1 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.delegatecall(0x93fdc929, stor_4_0_19, v0, varg0 & ~0xffffffffffffffffffffffffffffffff & ~0xffffffffffffffffffffffffffffffff, varg1, varg2, varg3, varg4, varg5, varg6, varg7).gas(msg.gas - 710);
    require(v1);
    emit 0xa543a0fdbe4c677f8ac450772f98d34ced6e7ed99d9876cd73c0e132d35f791c(v0);
    stor_1 += 1;
}

function 0x98a84292(uint256 varg0, uint256 varg1) public nonPayable { 
    v0, v1 = 0x1a67(varg1, varg0);
    return v1, v0;
}

function startMinting() public nonPayable { 
    require(_owner == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xd87f3856, stor_2_0_19).gas(msg.gas - 710);
    require(v0);
}

function 0xa00fedc7() public nonPayable { 
    return stor_6;
}

function totalBalance() public nonPayable { 
    return _totalBalance;
}

function withdrawExcess(address varg0) public nonPayable { 
    require(_owner == msg.sender);
    assert(_totalBalance <= (address(this)).balance);
    v0 = varg0.call().value((address(this)).balance - _totalBalance).gas(!((address(this)).balance - _totalBalance) * 2300);
    require(v0);
}

function 0xb4fbe80a(uint256 varg0, uint256 varg1) public nonPayable { 
    assert(varg1 < owner_c[address(varg0)]);
    return STORAGE[keccak256(keccak256(address(varg0), 12)) + varg1];
}

function highestBidder(bytes32 varg0) public nonPayable { 
    return address(_highestBidder[varg0]);
}

function 0xc1666a30(uint256 varg0) public nonPayable { 
    MEM[160 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1, v2, v3, v4, v5 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xd041e57, stor_2_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return v1 & ~0xffffffffffffffffffffffffffffffff, address(v2), v3, v4, v5;
}

function 0xc73dedfd(uint256 varg0) public nonPayable { 
    return address(owner_9[varg0]);
}

function 0xc756b8e9(uint256 varg0, uint256 varg1) public nonPayable { 
    v0 = 0x1d04(varg1, varg0);
    return v0;
}

function 0xc9c0c242(uint256 varg0, uint256 varg1) public nonPayable { 
    return owner_d[keccak256(varg0, address(varg1))];
}

function 0xcacb7ad8(uint256 varg0) public payable { 
    require(!_paused);
    require(block.timestamp < owner_8[varg0]);
    assert(0x3f480 <= owner_8[varg0]);
    require(block.timestamp > owner_8[varg0] - 0x3f480);
    assert(100);
    v0 = _SafeMul(1, msg.value / 100);
    assert(v0 <= msg.value);
    v1 = keccak256(varg0, msg.sender);
    if (!owner_d[v1]) {
        owner_c[msg.sender] = owner_c[msg.sender] + 1;
        if (!owner_c[msg.sender] <= owner_c[msg.sender] + 1) {
            v2 = v3 = owner_c[msg.sender] + 1 + keccak256(keccak256(msg.sender, 12));
            while (keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender] > v2) {
                STORAGE[v2] = 0;
                v2 += 1;
            }
            goto 0x1ec9B0x760;
        }
        STORAGE[keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender]] = varg0;
    }
    assert(msg.value - v0 + owner_d[v1] >= owner_d[v1]);
    owner_d[v1] += msg.value - v0;
    assert(msg.value - v0 + _balances[msg.sender] >= _balances[msg.sender]);
    _balances[msg.sender] += msg.value - v0;
    assert(msg.value - v0 + _totalBalance >= _totalBalance);
    _totalBalance += msg.value - v0;
    assert(0x2386f26fc10000 + owner_a[varg0] >= owner_a[varg0]);
    if (owner_d[v1] < 0x2386f26fc10000 + owner_a[varg0]) {
        goto 0x35f7;
    } else {
        owner_a[v1] = owner_d[v1];
        owner_a[v1] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & owner_a[v1];
    }
}

function 0xcb551a2b(uint256 varg0) public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.getHash(stor_3_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function 0xd5ee9ca4() public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v0, v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.delegatecall(0xf5807181, stor_3_0_19).gas(msg.gas - 710);
    require(v0);
    return v1;
}

function getAuctionsLength() public nonPayable { 
    return _getAuctionsLength.length;
}

function 0xdc341d8d(uint256 varg0, uint256 varg1) public nonPayable { 
    require(!_paused);
    0x26af(varg0);
    v0, v1 = 0x1a67(varg1, varg0);
    require(block.timestamp > v0);
    v2, v3, v4, v5, v6 = 0x12cc(varg1);
    v7, v8, v9 = 0x1749(varg0);
    if (v5 == 1) {
        if (v3 == stor_5) {
            assert(1 + v1 >= v1);
            v10 = _SafeMul(1 + v1, v4);
            assert(v10 + v9 >= v9);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v11 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1253a59c, stor_2_0_19, varg0, v10 + v9).gas(msg.gas - 710);
            require(v11);
        }
        if (v3 == stor_7) {
            assert(1 + v1 >= v1);
            v12 = _SafeMul(1 + v1, v4);
            assert(v12 + v8 >= v8);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v13 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x985a78d3, stor_2_0_19, varg0, v12 + v8).gas(msg.gas - 710);
            require(v13);
        }
        if (v3 == stor_6) {
            assert(1 + v1 >= v1);
            v14 = _SafeMul(1 + v1, v4);
            assert(v14 + v7 >= v7);
            require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
            v15 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xa04e8cb9, stor_2_0_19, varg0, v14 + v7).gas(msg.gas - 710);
            require(v15);
        }
    }
    if (2 == v5) {
        v16 = 0x1d04(v3, varg0);
        v17, v18, v19 = 0x1393(v3);
        v20 = _SafeMul(v1, v4);
        assert(1 + v20 >= v20);
        v21 = _SafeMul(1 + v20, v19);
        v22 = _SafeMul(1 + v20, v18);
        v23 = _SafeMul(1 + v20, v17);
        v24 = v25 = v9 >= v21;
        if (v25) {
            v24 = v26 = v8 >= v22;
        }
        if (v24) {
            v24 = v7 >= v23;
        }
        require(v24);
        assert(v21 <= v9);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v27 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x1253a59c, stor_2_0_19, varg0, v9 - v21).gas(msg.gas - 710);
        require(v27);
        assert(v22 <= v8);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v28 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x985a78d3, stor_2_0_19, varg0, v8 - v22).gas(msg.gas - 710);
        require(v28);
        assert(v23 <= v7);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v29 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xa04e8cb9, stor_2_0_19, varg0, v7 - v23).gas(msg.gas - 710);
        require(v29);
        assert(1 + v20 + v16 >= v16);
        require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
        v30 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x56c1c099, stor_2_0_19, varg0, v3, 1 + v20 + v16).gas(msg.gas - 710);
        require(v30);
    }
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v31 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf28c3ee3, stor_2_0_19, varg0, varg1, v2 * 3600 + block.timestamp).gas(msg.gas - 710);
    require(v31);
    emit 0x9afc6e84262b245e3a80ef387f2b777dfe649ffc2eed92f9375b893a5539b0ca(varg0, varg1);
}

function 0xe82acd26(uint256 varg0) public nonPayable { 
    require(_owner == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.upgrade(stor_2_0_19, address(varg0)).gas(msg.gas - 710);
    require(v0);
    require(0xb939a1d96dda7271d6d89eaceabd9163d0502165.code.size);
    v1 = 0xb939a1d96dda7271d6d89eaceabd9163d0502165.upgrade(stor_3_0_19, address(varg0)).gas(msg.gas - 710);
    require(v1);
    require(0x902904b1833def4aef05b99cea93cc3383cd2d4a.code.size);
    v2 = 0x902904b1833def4aef05b99cea93cc3383cd2d4a.upgrade(stor_4_0_19, address(varg0)).gas(msg.gas - 710);
    require(v2);
}

function 0xed8faf3d() public nonPayable { 
    return stor_3_0_19;
}

function startAuction(bytes32 varg0) public nonPayable { 
    require(!_paused);
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x69c5b2b8, stor_2_0_19, varg0).gas(msg.gas - 710);
    require(v0);
    require(address(v1) == msg.sender);
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v2 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0xf1ed0c6, stor_2_0_19, varg0, address(this)).gas(msg.gas - 710);
    require(v2);
    _highestBidder[varg0] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & _highestBidder[varg0];
    owner_a[varg0] = 0;
    owner_9[varg0] = msg.sender | ~0xffffffffffffffffffffffffffffffffffffffff & owner_9[varg0];
    owner_9[varg0] = block.timestamp + 0x3f480;
    owner_c[msg.sender] = owner_c[msg.sender] + 1;
    if (!owner_c[msg.sender] <= owner_c[msg.sender] + 1) {
        v3 = v4 = owner_c[msg.sender] + 1 + keccak256(keccak256(msg.sender, 12));
        while (keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender] > v3) {
            STORAGE[v3] = 0;
            v3 += 1;
        }
        goto 0x2546;
    }
    STORAGE[keccak256(keccak256(msg.sender, 12)) + owner_c[msg.sender]] = varg0;
    _getAuctionsLength.length = _getAuctionsLength.length + 1;
    if (!_getAuctionsLength.length <= _getAuctionsLength.length + 1) {
        v5 = v6 = _getAuctionsLength.length + 1 + keccak256(16);
        while (keccak256(16) + _getAuctionsLength.length > v5) {
            STORAGE[v5] = 0;
            v5 += 1;
        }
        goto 0x2567;
    }
    _getAuctionsLength[_getAuctionsLength.length] = varg0;
}

function transferOwnership(address varg0) public nonPayable { 
    require(_owner == msg.sender);
    require(varg0);
    emit OwnershipTransferred(_owner, varg0);
    _owner = varg0;
}

function 0xf5807181(uint256 varg0) public nonPayable { 
    MEM[32 + MEM[64]] = 0;
    require(0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.code.size);
    v0, v1 = 0xe5ef9a283508bbfd11d5379efc4146a4e4a26b8a.delegatecall(0x6dff11, stor_2_0_19, address(varg0)).gas(msg.gas - 710);
    require(v0);
    return v1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 96;
    if (msg.data.length >= 4) {
        v0 = uint32(function_selector >> 224);
        if (v0 == 0x1db46a0) {
            endAuction(bytes32);
        } else if (0x258a643 == v0) {
            0x0258a643();
        } else if (0x93556c9 == v0) {
            0x093556c9();
        } else if (0x10cfcf0c == v0) {
            0x10cfcf0c();
        } else if (0x245454b5 == v0) {
            0x245454b5();
        } else if (0x2516930f == v0) {
            0x2516930f();
        } else if (0x27e235e3 == v0) {
            balances(address);
        } else if (0x30b654f8 == v0) {
            0x30b654f8();
        } else if (0x3f4ba83a == v0) {
            unpause();
        } else if (0x40d7f8c0 == v0) {
            0x40d7f8c0();
        } else if (0x468c7804 == v0) {
            0x468c7804();
        } else if (0x48d79c6f == v0) {
            0x48d79c6f();
        } else if (0x5096ec53 == v0) {
            0x5096ec53();
        } else if (0x571a26a0 == v0) {
            auctions(uint256);
        } else if (0x5c975abb == v0) {
            paused();
        } else if (0x61508bfd == v0) {
            0x61508bfd();
        } else if (0x66760ce6 == v0) {
            0x66760ce6();
        } else if (0x66cfc337 == v0) {
            0x66cfc337();
        } else if (0x7621bd09 == v0) {
            0x7621bd09();
        } else if (0x78a11bf0 == v0) {
            0x78a11bf0();
        } else if (0x7bbe0176 == v0) {
            0x7bbe0176();
        } else if (0x7e403f26 == v0) {
            0x7e403f26();
        } else if (0x7f1c5886 == v0) {
            0x7f1c5886();
        } else if (0x8063a94b == v0) {
            0x8063a94b();
        } else if (0x82768573 == v0) {
            0x82768573();
        } else if (0x8456cb59 == v0) {
            pause();
        } else if (0x8764d2e2 == v0) {
            0x8764d2e2();
        } else if (0x8ca25ab4 == v0) {
            0x8ca25ab4();
        } else if (0x8da5cb5b == v0) {
            owner();
        } else if (0x8e19899e == v0) {
            withdraw(bytes32);
        } else if (0x974f1e9e == v0) {
            0x974f1e9e();
        } else if (0x98a84292 == v0) {
            0x98a84292();
        } else if (0x9a65ea26 == v0) {
            startMinting();
        } else if (0xa00fedc7 == v0) {
            0xa00fedc7();
        } else if (0xad7a672f == v0) {
            totalBalance();
        } else if (0xaffbf593 == v0) {
            withdrawExcess(address);
        } else if (0xb4fbe80a == v0) {
            0xb4fbe80a();
        } else if (0xbf51e728 == v0) {
            highestBidder(bytes32);
        } else if (0xc1666a30 == v0) {
            0xc1666a30();
        } else if (0xc73dedfd == v0) {
            0xc73dedfd();
        } else if (0xc756b8e9 == v0) {
            0xc756b8e9();
        } else if (0xc9c0c242 == v0) {
            0xc9c0c242();
        } else if (0xcacb7ad8 == v0) {
            0xcacb7ad8();
        } else if (0xcb551a2b == v0) {
            0xcb551a2b();
        } else if (0xd5ee9ca4 == v0) {
            0xd5ee9ca4();
        } else if (0xdbe35007 == v0) {
            getAuctionsLength();
        } else if (0xdc341d8d == v0) {
            0xdc341d8d();
        } else if (0xe82acd26 == v0) {
            0xe82acd26();
        } else if (0xed8faf3d == v0) {
            0xed8faf3d();
        } else if (0xede8acdb == v0) {
            startAuction(bytes32);
        } else if (0xf2fde38b == v0) {
            transferOwnership(address);
        } else if (0xf5807181 == v0) {
            0xf5807181();
        }
    }
    ();
}
