// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Mika {
  string name = "Mika";

  function convert(string memory name_) pure public returns (uint length_) {
    bytes memory b = bytes(name_);
    length_ = b.length;
  }

  function getElementAt(uint index_) view public returns (bytes1 character_) {
    bytes memory data = bytes(name);
    character_ = data[index_];
  }
}