// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract task1 {

    struct Student{
        bool IsRegistered;
        address studentID;
        uint256 percentage;
        uint256 totalMark;
    }
    Student[] public students;
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

   function register(address _studentID, uint256 _percentage, uint256 _totalMark) public onlyOwner {
    //cannot create with a same address
    require(!addressToStundent[_studentID].IsRegistered,"already registered");
    //Create a new Student
    Student memory _student = Student(true, _studentID, _percentage, _totalMark);
    addressToStundent[_studentID] = _student;
   }
}
