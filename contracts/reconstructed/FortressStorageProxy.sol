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
        address _fortressStorage, 
        address _user
    ) 
        public
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = varg0.call(uint32(0xf5807181), _user).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getFortress(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* bytes16 */ v1 = _fortressStorage.getName(_fortressHash).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v2, /* address */ v3 = _fortressStorage.getOwner(_fortressHash).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));

        // 0xcdf28eaf = getX(bytes32)
        v4, /* uint256 */ v5 = _fortressStorage.call(uint32(0xcdf28eaf), _fortressHash).gas(msg.gas - 710);
        require(bool(v4));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));

        // 0x3141d0db = getY(bytes32)
        v6, /* uint256 */ v7 = _fortressStorage.call(uint32(0x3141d0db), _fortressHash).gas(msg.gas - 710);
        require(bool(v6));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));

        // 0xb6d7e8a1 = getWins(bytes32)
        v8, /* uint256 */ v9 = _fortressStorage.call(uint32(0xb6d7e8a1), _fortressHash).gas(msg.gas - 710);
        require(bool(v8));
        return bytes16(MEM[MEM[64]]), address(v3), v5, v7, v9;
    }

    function setOwner(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        address _newOwner
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = varg0.setOwner(_fortressHash, _newOwner).gas(msg.gas - 710);
        require(bool(v0));
    }

    function setGold(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.call(uint32(0x70c92125), _fortressHash, _amount).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getFortressesAvailable(address _fortressStorage)
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0x468c7804)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getFortressCount(address _fortressStorage) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0x10cfcf0c)).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function getBuilding(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _buildingHash
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0x31857c44), _fortressHash, _buildingHash).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v2, /* uint256 */ v3 = _fortressStorage.call(uint32(0xb41cddba), _fortressHash, _buildingHash).gas(msg.gas - 710);
        require(bool(v2));
        return v1, v3;
    }

    function getHashFromIndex(
        address _fortressStorage, 
        address _user, 
        uint256 _index
    ) 
        public
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0x78a11bf0), _user, _index).gas(msg.gas - 710);
        require(bool(v0));
        return uint256(v1);
    }

    function setTroups(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _troupHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.call(uint32(0x45c7d3a6), _fortressHash, _troupHash, _amount).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getResources(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0xe75f7871), _fortressHash).gas(msg.gas - 710);
        require(bool(v0));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v2, /* uint256 */ v3 = _fortressStorage.call(uint32(0xe382af35), _fortressHash).gas(msg.gas - 710);
        require(bool(v2));
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v4, /* uint256 */ v5 = _fortressStorage.call(uint32(0xe0d87dc2), _fortressHash).gas(msg.gas - 710);
        require(bool(v4));
        return v1, v3, v5;
    }

    function getOwner(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(account.code.size));
        v0, /* address */ v1 = _fortressStorage.getOwner(uint256(_fortressHash)).gas(msg.gas - 710);
        require(bool(v0));
        return address(v1);
    }

    function build(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _buildingHash, 
        uint256 _gold, 
        uint256 _stone, 
        uint256 _wood, 
        uint256 _level
    )
        public 
        payable 
    { 
        require(bool(varg0.code.size));

        // 0x70c92125 = setGold(bytes32,uint256)
        v0 = varg0.call(uint32(0x70c92125), _fortressHash, _gold).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(varg0.code.size));

        // 0x6d0af38e = setStone(bytes32,uint256)
        v1 = varg0.call(uint32(0x6d0af38e), _fortressHash, _stone).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(varg0.code.size));

        // 0x9c8b8588 = setWood(bytes32,uint256)
        v2 = varg0.call(uint32(0x9c8b8588), _fortressHash, _wood).gas(msg.gas - 710);
        require(bool(v2));
        require(bool(varg0.code.size));

        // 0x8ff4efb7 = setBuildingLevel(bytes32,bytes32,uint256)
        v3 = varg0.call(uint32(0x8ff4efb7), _fortressHash, _buildingHash, _level).gas(msg.gas - 710);
        require(bool(v3));
    }

    function setStone(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.call(uint32(0x6d0af38e), _fortressHash, _amount).gas(msg.gas - 710);
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
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.call(uint32(0x9c8b8588), _fortressHash, _amount).gas(msg.gas - 710);
        require(bool(v0));
    }

    function transfer(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        address _newOwner
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.setOwner(_fortressHash, _newOwner).gas(msg.gas - 710);
        require(bool(v0));
    }

    function createFortress(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes16 _name, 
        int256 _x, 
        int256 _y, 
        uint256 _gold, 
        uint256 _stone, 
        uint256 _wood, 
        uint256 _level, 
        address _owner
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));

        // 0x43244b61 = createFortress(bytes32,address)
        v0 = _fortressStorage.call(uint32(0x43244b61), _fortressHash, _owner).gas(msg.gas - 710);
        require(bool(v0));
        require(bool(varg0.code.size));

        // 0xf776c071 = setName(bytes32,bytes16)
        v1 = _fortressStorage.call(uint32(0xf776c071), _fortressHash, _name).gas(msg.gas - 710);
        require(bool(v1));
        require(bool(varg0.code.size));

        // 0x69c6821d = setX(bytes32,int256)
        v2 = _fortressStorage.call(uint32(0x69c6821d), _fortressHash, _x).gas(msg.gas - 710);
        require(bool(v2));
        require(bool(varg0.code.size));

        // 0xb874b685 = setY(bytes32,int256)
        v3 = _fortressStorage.call(uint32(0xb874b685), _fortressHash, _y).gas(msg.gas - 710);
        require(bool(v3));
        require(bool(varg0.code.size));

        // 0x70c92125 = setGold(bytes32,uint256)
        v4 = _fortressStorage.call(uint32(0x70c92125), _fortressHash, _gold).gas(msg.gas - 710);
        require(bool(v4));
        require(bool(varg0.code.size));

        // 0x6d0af38e = setStone(bytes32,uint256)
        v5 = _fortressStorage.call(uint32(0x6d0af38e), _fortressHash, _stone).gas(msg.gas - 710);
        require(bool(v5));
        require(bool(varg0.code.size));

        // 0x9c8b8588 = setWood(bytes32,uint256)
        v6 = _fortressStorage.call(uint32(0x9c8b8588), _fortressHash, _wood).gas(msg.gas - 710);
        require(bool(v6));
        require(bool(varg0.code.size));

        // 0x2fb59b80 = setLevel(bytes32,uint256)
        v7 = _fortressStorage.call(uint32(0x2fb59b80), _fortressHash, _level).gas(msg.gas - 710);
        require(bool(v7));
    }

    function startMinting(address _fortressStorage) public payable { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.startMinting().gas(msg.gas - 710);
        require(bool(v0));
    }

    function setBuildingTimeout(
        address _fortressStorage,
        bytes32 _fortressHash, 
        bytes32 _buildingHash, 
        uint256 _timeout
    ) 
        public 
        payable 
    { 
        require(bool(varg0.code.size));
        v0 = _fortressStorage.call(uint32(0xb9d8a1cf), _fortressHash, _buildingHash, _timeout).gas(msg.gas - 710);
        require(bool(v0));
    }

    function getTroups(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _troupHash
    ) 
        public 
        payable 
    { 
        MEM[32 + MEM[64]] = 0;
        require(bool(varg0.code.size));
        v0, /* uint256 */ v1 = _fortressStorage.call(uint32(0x6c4426be), _fortressHash, _troupHash).gas(msg.gas - 710);
        require(bool(v0));
        return v1;
    }

    function() public payable {
        revert();
    }
}