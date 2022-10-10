// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task2 {

    mapping(address => uint256) addrToAmount;

    function deposit (uint256 _amount) public {
        addrToAmount[msg.sender] = _amount;
    }

    function checkBalance(address _addr) public view returns(uint256){
        return addrToAmount[_addr];
    }

}
