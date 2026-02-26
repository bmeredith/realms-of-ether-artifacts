pragma solidity 0.4.18;

/// @title TroupStorageProxy for Realms of Ether (https://www.realmsofether.com)
/// @notice Reconstructed by wilt.eth/@wilty_stilty
///
/// @notice Logic library contract for troup management in Realms of Ether.
/// Intended to be called via delegatecall from the main game contract,
/// allowing the main game contract to interact with TroupStorage while
/// keeping the main contract's bytecode size within limits.
/// Also provides read-only convenience functions (getTroup, getCosts)
/// that can be called directly.
///
/// @dev RECONSTRUCTION NOTICE: The original source code for this contract was lost.
/// This file has been reconstructed in its entirety from the deployed bytecode.
import {ITroupStorage} from "./interfaces/ITroupStorage.sol";

contract TroupStorageProxy {
    function getTroup(address _troupStorage, bytes32 _troupHash)
        public
        returns (
            bytes16,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        ITroupStorage storage = ITroupStorage(_troupStorage);
        bytes16 name = storage.getName(_troupHash);
        uint256 life = storage.getLife(_troupHash);
        uint256 strength = storage.getStrength(_troupHash);
        uint256 intelligence = storage.getIntelligence(_troupHash);
        uint256 dexterity = storage.getDexterity(_troupHash);
        return (name, life, strength, intelligence, dexterity);
    }

    function createTroup(
        address _troupStorage, 
        bytes32 _troupHash, 
        bytes16 _name, 
        uint256 _life, 
        uint256 _strength, 
        uint256 _intelligence, 
        uint256 _dexterity, 
        uint256 _gold, 
        uint256 _wood, 
        uint256 _stone
    ) 
        public 
    { 
        ITroupStorage storage = ITroupStorage(_troupStorage);
        storage.createTroup(_troupHash);
        storage.setName(_troupHash, _name);
        storage.setLife(_troupHash, _life);
        storage.setStrength(_troupHash, _strength);
        storage.setIntelligence(_troupHash, _intelligence);
        storage.setDexterity(_troupHash, _dexterity);
        storage.setGold(_troupHash, _gold);
        storage.setWood(_troupHash, _wood);
        storage.setStone(_troupHash, _stone);
    }

    function upgrade(address proxy, address implementation) 
        public 
    { 
        ITroupStorage(proxy).transferOwnership(implementation);
    }

    function getHash(address _troupStorage, uint256 _nonce) 
        public 
        returns (bytes32)
    {
        return ITroupStorage(_troupStorage).getHash(_nonce);
    }

    function getIndexLength(address _troupStorage) 
        public 
        returns (uint256)
    { 
        return ITroupStorage(_troupStorage).getIndexLength();
    }

    function getCosts(address _troupStorage, bytes32 _troupHash) 
        public 
        returns (uint256, uint256, uint256)
    { 
        ITroupStorage storage = ITroupStorage(_troupStorage);
        uint256 gold = storage.getGold(_troupHash);
        uint256 wood = storage.getWood(_troupHash);
        uint256 stone = storage.getStone(_troupHash);
        return (gold, wood, stone);
    }

    function fallback() public payable { 
        revert();
    }
}