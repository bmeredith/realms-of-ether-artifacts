pragma solidity 0.4.18;

import {IFortressStorage} from "./interfaces/IFortressStorage.sol";

/// @title FortressStorageProxy for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Logic library contract for fortress management in Realms of Ether.
/// Called via delegatecall from the main game contract, allowing the main
/// game contract to interact with FortressStorage using its own execution context.
/// Also provides read-only convenience functions (getFortress, getResources)
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
        returns (uint256)
    {
        return IFortressStorage(_fortressStorage).getIndexLength(_user);
    }

    function getFortress(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
        returns (
            bytes16,
            address,
            int256,
            int256,
            uint256
        )
    { 
        return (
            IFortressStorage(_fortressStorage).getName(_fortressHash),
            IFortressStorage(_fortressStorage).getOwner(_fortressHash),
            IFortressStorage(_fortressStorage).getX(_fortressHash),
            IFortressStorage(_fortressStorage).getY(_fortressHash),
            IFortressStorage(_fortressStorage).getWins(_fortressHash)
        );
    }

    function setOwner(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        address _newOwner
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).setOwner(_fortressHash, _newOwner);
    }

    function setGold(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).setGold(_fortressHash, _amount);
    }

    function getFortressesAvailable(address _fortressStorage)
        public 
        payable 
        returns (uint256)
    { 
        return IFortressStorage(_fortressStorage).getFortressesAvailable();
    }

    function getFortressCount(address _fortressStorage) 
        public 
        payable 
        returns (uint256)
    { 
        return IFortressStorage(_fortressStorage).getFortressCount();
    }

    function getBuilding(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _buildingHash
    ) 
        public 
        payable 
        returns (
            uint256,
            uint256
        )
    { 
        return (
            IFortressStorage(_fortressStorage)
                .getBuildingLevel(_fortressHash, _buildingHash),
            IFortressStorage(_fortressStorage)
                .getBuildingTimeout(_fortressHash, _buildingHash)
        );
    }

    function getHashFromIndex(
        address _fortressStorage, 
        address _user, 
        uint256 _index
    ) 
        public
        payable 
        returns (bytes32)
    { 
        return IFortressStorage(_fortressStorage)
            .getHashFromIndex(_user, _index);
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
        IFortressStorage(_fortressStorage)
            .setTroups(_fortressHash, _troupHash, _amount);
    }

    function getResources(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
        returns (
            uint256,
            uint256,
            uint256
        )
    { 
        return (
            IFortressStorage(_fortressStorage).getGold(_fortressHash),
            IFortressStorage(_fortressStorage).getStone(_fortressHash),
            IFortressStorage(_fortressStorage).getWood(_fortressHash)
        );
    }

    function getOwner(
        address _fortressStorage, 
        bytes32 _fortressHash
    ) 
        public 
        payable 
        returns (address)
    { 
        return IFortressStorage(_fortressStorage).getOwner(_fortressHash);
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
        IFortressStorage(_fortressStorage).setGold(_fortressHash, _gold);
        IFortressStorage(_fortressStorage).setStone(_fortressHash, _stone);
        IFortressStorage(_fortressStorage).setWood(_fortressHash, _wood);
        IFortressStorage(_fortressStorage)
            .setBuildingLevel(_fortressHash, _buildingHash, _level);
    }

    function setStone(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).setStone(_fortressHash, _amount);
    }

    function upgrade(address proxy, address implementation)
        public 
        payable 
    { 
        IFortressStorage(proxy).transferOwnership(implementation);
    }

    function setWood(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        uint256 _amount
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).setWood(_fortressHash, _amount);
    }

    function transfer(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        address _newOwner
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).setOwner(_fortressHash, _newOwner);
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
        uint256 _wins, 
        address _user
    ) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).createFortress(_fortressHash, _user);
        IFortressStorage(_fortressStorage).setName(_fortressHash, _name);
        IFortressStorage(_fortressStorage).setX(_fortressHash, _x);
        IFortressStorage(_fortressStorage).setY(_fortressHash, _y);
        IFortressStorage(_fortressStorage).setGold(_fortressHash, _gold);
        IFortressStorage(_fortressStorage).setStone(_fortressHash, _stone);
        IFortressStorage(_fortressStorage).setWood(_fortressHash, _wood);
        IFortressStorage(_fortressStorage).setWins(_fortressHash, _wins);
    }

    function startMinting(address _fortressStorage) 
        public 
        payable 
    { 
        IFortressStorage(_fortressStorage).startMinting();
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
        IFortressStorage(_fortressStorage)
            .setBuildingTimeout(_fortressHash, _buildingHash, _timeout);
    }

    function getTroups(
        address _fortressStorage, 
        bytes32 _fortressHash, 
        bytes32 _troupHash
    ) 
        public 
        payable 
        returns (uint256)
    { 
        IFortressStorage(_fortressStorage).getTroups(_fortressHash, _troupHash);
    }

    function() public payable {
        revert();
    }
}