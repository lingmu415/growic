// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract task6 is ERC20 {
    constructor(string memory _name, string memory _symbol,uint256 _supply) ERC20(_name, _symbol){
        _mint(msg.sender, _supply);
    }
}
