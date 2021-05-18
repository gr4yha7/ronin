// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Modifiers {
    uint public minimumBidAmount = 1000;
    
    modifier isGreaterThanMinAmount() {
        if (msg.value >= minimumBidAmount) {
            _;
        } else {
            revert();
        }
    }
    
    function bid(uint _amount) isGreaterThanMinAmount payable public returns (bool) {
        
    }
}