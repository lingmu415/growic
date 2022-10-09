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


   function getStudentDetails(address _studentID) public view returns(Student memory){
       return addressToStundent[_studentID];
   }


   function register(address _studentID, uint256 _percentage, uint256 _totalMark) public onlyOwner {
       //cannot create with a same address
       require(!addressToStundent[_studentID].IsRegistered,"already registered");
       //Create a new Student
       Student memory _student = Student({
        IsRegistered: true,
        studentID: _studentID,
        percentage: _percentage,
        totalMark: _totalMark
        });
       addressToStundent[_studentID] = _student;
   }
}
