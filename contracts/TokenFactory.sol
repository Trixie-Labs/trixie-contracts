// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "./token/TrixieTokenERC20.sol";

/**
 * @title TokenFactory
 * @dev Create parameterized tokens
 */

 contract TokenFactory {
    //move to an interface 
    /**
     */
    event TokenCreated(address indexed owner, address indexed tokenAddress);

    // this factory must be upgradable. 
    constructor(){

    }

    mapping (address => address) public ownersByToken;
    uint256 public count;
    
    function getERC20Instance(string memory name, string memory symbol) public returns (address) {
        address admin = msg.sender;
        address minter = msg.sender;
        TrixieTokenERC20 token = new TrixieTokenERC20(name, symbol, admin, minter);
        ownersByToken[address(token)] = admin;
        count++;
        emit TokenCreated(admin, address(token));
        return address(token);
    }


 }
