// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task4 {

    error AmountToSmall();
    error NoBalance();

    uint256 constant private Fee = 0.1 ether;

    mapping(address => uint256) balanceOf;

    address payable owner;

    //create a modifier that only allows the owner of the contract to withdraw the funds.
    modifier onlyOwner(){
        require(msg.sender == owner, "you are not an owner");
        _;
    }

    //Create a modifier that accepts a value(uint256 _amount)
    modifier moreThanFee(uint256 _amount){
        if(_amount < Fee){
            revert AmountToSmall();
        }
        _;
    }

    //create a modifier that only allows users that have deposited
    modifier hasBalance(){
        if(balanceOf[msg.sender] == 0){
            revert NoBalance();
        }
        _;
    }

    constructor(){
        owner = payable(msg.sender);
    }
    

    function withdraw() public onlyOwner{
        (bool success,) = owner.call{value: address(this).balance}("");
        require(success,"failed to transfer");
    }

    function deposit(uint256 _amount) public{
        balanceOf[msg.sender] += _amount;
    }

    function addFund(uint256 _amount) public moreThanFee(_amount) hasBalance{
        balanceOf[msg.sender] += _amount;
    }
}
