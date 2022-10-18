// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task5 {

    error AmountToSmall();
    error NoBalance();

    // Set events
    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);

    struct User{
        string name;
        uint8 age;
    }

    mapping(address => User) addrToUser;

    uint256 constant private Fee = 0.1 ether;

    mapping(address => uint256) balanceOf;

    address payable owner;

    modifier onlyOwner(){
        require(msg.sender == owner, "you are not an owner");
        _;
    }

    modifier moreThanFee(uint256 _amount){
        if(_amount < Fee){
            revert AmountToSmall();
        }
        _;
    }

    modifier hasBalance(){
        if(balanceOf[msg.sender] == 0){
            revert NoBalance();
        }
        _;
    }




    function setUserDetails(string calldata _name, uint8 _age) public {
        addrToUser[msg.sender] = User(_name, _age);
        // Emit an event.
        emit ProfileUpdated(msg.sender);
    }

    function getUserDetail() public view returns(User memory){
        return addrToUser[msg.sender];
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
        // Emit an event,
        emit FundsDeposited(msg.sender, _amount);
    }

    function addFund(uint256 _amount) public moreThanFee(_amount) hasBalance{
        balanceOf[msg.sender] += _amount;
    }
}
