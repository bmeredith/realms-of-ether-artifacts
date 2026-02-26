pragma solidity 0.4.18;

/// @title FortressStorageProxy for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Logic library contract for fortress management in Realms of Ether.
/// Called via delegatecall from the main game contract, allowing the main
/// game contract to interact with FortressStorage using its own execution context.
/// Also provides read-only convenience functions 
/// that can be called directly.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.

contract FortressStorageProxy {
    function getIndexLength(
        address varg0, 
        address varg1
    ) 
        public
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0xf5807181), varg1).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getFortress(
        address varg0, 
        bytes32 varg1
    ) 
        public 
        payable 
    { 
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

    function setOwner(
        address varg0, 
        bytes32 varg1, 
        address varg2
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.setOwner(varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
    }

    function setGold(
        address varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0x70c92125), varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getFortressesAvailable(address varg0)
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0x468c7804)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getFortressCount(address varg0) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0x10cfcf0c)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuilding(
        address varg0, 
        bytes32 varg1, 
        bytes32 varg2
    ) 
        public 
        payable 
    { 
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

    function getHashFromIndex(
        address varg0, 
        address varg1, 
        uint256 varg2
    ) 
        public
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0x78a11bf0), varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
        return uint256(v1);
    }

    function setTroups(
        address varg0, 
        bytes32 varg1, 
        bytes32 varg2, 
        uint256 varg3
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0x45c7d3a6), varg1, varg2, varg3).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getResources(
        address varg0, 
        bytes32 varg1
    ) 
        public 
        payable 
    { 
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

    function getOwner(
        address account, 
        bytes32 DATA
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(account.code.size));
        v0, /* address */ v1 = account.getOwner(uint256(DATA)).gas(msg.gas - 710);
        require(bool(v0));
        return address(v1);
    }

    function build(
        address varg0, 
        bytes32 varg1, 
        bytes32 varg2, 
        uint256 varg3, 
        uint256 varg4, 
        uint256 varg5, 
        uint256 varg6
    )
        public 
        payable 
    { 
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

    function setStone(
        address varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0x6d0af38e), varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
    }

    function upgrade(address proxy, address implementation)
        public 
        payable 
    { 
        require(bool(proxy.code.size));
        v0 = proxy.transferOwnership(implementation).gas(msg.gas - 710);
        require(bool(v0));
    }

    function setWood(
        address varg0, 
        bytes32 varg1, 
        uint256 varg2
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0x9c8b8588), varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
    }

    function transfer(
        address varg0, 
        bytes32 varg1, 
        address varg2
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.setOwner(varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
    }

    function createFortress(
        address varg0, 
        bytes32 varg1, 
        bytes16 varg2, 
        int256 varg3, 
        int256 varg4, 
        uint256 varg5, 
        uint256 varg6, 
        uint256 varg7, 
        uint256 varg8, 
        address varg9
    ) 
        public 
        payable 
    { 
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

    function startMinting(address varg0) public payable { 
        require(bool(varg0.code.size));
        v0 = varg0.startMinting().gas(msg.gas - 710);
        require(bool(v0));
    }

    function setBuildingTimeout(
        address varg0,
        bytes32 varg1, 
        bytes32 varg2, 
        uint256 varg3
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0xb9d8a1cf), varg1, varg2, varg3).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getTroups(
        address varg0, 
        bytes32 varg1, 
        bytes32 varg2
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0x6c4426be), varg1, varg2).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function() public payable {
        revert();
    }
}