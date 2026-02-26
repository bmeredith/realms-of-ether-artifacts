pragma solidity 0.4.18;

/// @title BuildingStorageProxy for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Logic library contract for building management in Realms of Ether.
/// Called via delegatecall from the main game contract, allowing the main
/// game contract to interact with BuildingStorage using its own execution context.
/// Also provides read-only convenience functions (getBuilding, getCosts)
/// that can be called directly.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.
contract BuildingStorageProxy {
    function upgrade(address proxy, address implementation) public payable { 
        require(bool(proxy.code.size));
        v0 = proxy.transferOwnership(implementation).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getBuilding(
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
        v2, /* uint256 */ v3 = varg0.call(uint32(0xdce9f070), varg1).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v4, /* uint256 */ v5 = varg0.call(uint32(0x50fdbd81), varg1).gas(msg.gas - 710);
        require(bool(v4));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v6, /* uint256 */ v7 = varg0.call(uint32(0xfe6f1143), varg1).gas(msg.gas - 710);
        require(bool(v6));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v8, /* uint256 */ v9 = varg0.call(uint32(0x8f822a5), varg1).gas(msg.gas - 710);
        require(bool(v8));
        return bytes16(v1), v3, v5, uint256(v7), v9;
    }

    function getHash(
        address _tokenAddress, 
        uint256 _tokenId
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(_tokenAddress.code.size));
        v0, /* uint256 */ v1 = _tokenAddress.getHash(_tokenId).gas(msg.gas - 710);
        require(bool(v0));
        return uint256(v1);
    }

    function createBuilding(
        address varg0, 
        bytes32 varg1, 
        bytes16 varg2, 
        uint256 varg3, 
        uint256 varg4, 
        bytes32 varg5, 
        uint256 varg6, 
        uint256 varg7, 
        uint256 varg8, 
        uint256 varg9
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.call(uint32(0x21d26a38), varg1).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(varg0.code.size));
        v1 = varg0.call(uint32(0xf776c071), varg1, varg2).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(varg0.code.size));
        v2 = varg0.call(uint32(0x4610af12), varg1, varg3).gas(msg.gas - 710);
        require(bool(v2));
        require(bool(varg0.code.size));
        v3 = varg0.call(uint32(0x394c1f42), varg1, varg4).gas(msg.gas - 710);
        require(bool(v3));
        require(bool(varg0.code.size));
        v4 = varg0.call(uint32(0x2c5e9b09), varg1, varg5).gas(msg.gas - 710);
        require(bool(v4));
        require(bool(varg0.code.size));
        v5 = varg0.call(uint32(0x8d4fd8c1), varg1, varg6).gas(msg.gas - 710);
        require(bool(v5));
        require(bool(varg0.code.size));
        v6 = varg0.call(uint32(0x70c92125), varg1, varg7).gas(msg.gas - 710);
        require(bool(v6));
        require(bool(varg0.code.size));
        v7 = varg0.call(uint32(0x9c8b8588), varg1, varg8).gas(msg.gas - 710);
        require(bool(v7));
        require(bool(varg0.code.size));
        v8 = varg0.call(uint32(0x6d0af38e), varg1, varg9).gas(msg.gas - 710);
        require(bool(v8));
    }

    function getIndexLength(address varg0) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.getIndexLength().gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getCosts(
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

    function() public payable {
        revert();
    }
}