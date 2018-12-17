pragma solidity ^0.5.0;

import "../modules/STO/USDTieredSTOStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "openzeppelin-solidity/contracts/utils/ReentrancyGuard.sol";
import "../modules/STO/ISTOStorage.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title USDTiered STO module Proxy
 */
contract USDTieredSTOProxy is USDTieredSTOStorage, ISTOStorage, ModuleStorage, Pausable, ReentrancyGuard, OwnedProxy {
    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor(address _securityToken, address _polyAddress, address _implementation) public ModuleStorage(_securityToken, _polyAddress) {
        require(_implementation != address(0), "Implementation address should not be 0x");
        __implementation = _implementation;
    }

}
