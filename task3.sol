// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task3 {

    struct User{
        string name;
        uint8 age;
    }

    mapping(address => User) addrToUser;


    function setUserDetails(string calldata _name, uint8 _age) public {
        addrToUser[msg.sender] = User(_name, _age);
    }

    function getUserDetail() public view returns(User memory){
        return addrToUser[msg.sender];
    }
}
