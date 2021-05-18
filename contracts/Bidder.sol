// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Bidder {
  uint biddingEnds = block.timestamp + 2 days;
  // high bidder struct
  struct HighBidder {
    address bidder;
    uint bid;
  }

  HighBidder public highestBidder;
  // constructor
  constructor() {
    highestBidder.bid = 1 ether;
  }
  // events
  event NewHighBid(address indexed bidder, uint bid);
  event BidFailed(address indexed bidder, uint bid);

  // timed modifier
  modifier timed {
    if (block.timestamp < biddingEnds) {
      _;
    } else {
      revert();
    }
  }

  // bid function
  function bid() payable timed public {
    if (msg.value > highestBidder.bid) {
      highestBidder.bidder = msg.sender;
      highestBidder.bid = msg.value;
      emit NewHighBid(msg.sender, msg.value);
    } else {
      emit BidFailed(msg.sender, msg.value);
      revert();
    }
  }
}