// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task1 {

    struct Student{
        bool IsRegistered;
        address studentID;
        uint256 percentage;
        uint256 totalMark;
    }
    address payable owner;
    mapping(address => Student) addressToStundent;

    modifier onlyOwner(){
        require(msg.sender == owner,"you are not an owner");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
    }

   function getStudentDetails(address studentID) public view returns(Student memory){
    return addressToStundent[studentID];
   }

   function register(address studentID) public onlyOwner {
    require(!addressToStundent[studentID].IsRegistered,"already registered");
    addressToStundent[studentID].IsRegistered = true;
   }
}
