// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vendingMachine{
    address public owner;
    mapping (address => uint)public donutBalences;

    constructor(){
        owner = msg.sender;
        donutBalences[address(this)] = 100;
    }
    
    function getVendingMachineBalence()public view returns (uint){
        return donutBalences[address(this)];
    }

    function restock(uint amount)public {
        require(msg.sender == owner, "only owner");
        donutBalences[address(this)]+=amount;
    }

    function purchase (uint amount)public payable {
        require(msg.value>= amount*1 ether,"not having sufficient balence ");
        require(donutBalences[address (this)]>=amount);
        donutBalences[address(this)] -= amount;
        donutBalences[msg.sender]+= amount;
    }
}