// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract CrowFunding {
  address public owner;
  uint public raised;

  mapping(address => uint) public balances;

  constructor() {
    owner = msg.sender;
  }

  function donate() public payable {
    raised += msg.value;
    balances[msg.sender] += msg.value;
  }
  
}
