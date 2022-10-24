// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task7 {

    mapping(address => uint256) addrToAmount;

    function deposit () payable public {
        addrToAmount[msg.sender] += msg.value;
    }

    function checkBalance() public view returns(uint256){
        return addrToAmount[msg.sender];
    }

}
