// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CrowFunding.sol";

contract TestCrowFunding {
  
  // 1. solo el propietario puede crearlo
  function testSettingAnOwnerDuringCreation() public {
    // ARRANGE
    CrowFunding crowFunding = new CrowFunding();
    
    // ACT
    // address expected = address(crowfunding.owner());
    // address thisAddress = address(this);
        
    // ACT and ASSERT
    // Assert.equal(expected, thisAddress, 
    Assert.equal(address(crowFunding.owner()), address(this), 
                   "ALERT: an owner is different than a deployer");
  }
  
  // 2. solo el propietario puede desplegarlo
  function testSettingAnOwnerOfDeployedContract() public {
    // ARRANGE
    CrowFunding crowFunding = CrowFunding(DeployedAddresses.CrowFunding());
    
    // ACT and ASSERT
    Assert.equal(address(crowFunding.owner()), msg.sender, 
                   "ALERT: an owner is different than a deployer");
  }
  
  // 3y4. Comprobar donaciones a nuestra campaña
  uint public initialBalance = 10 ether;

  function testAcceptingDonations() public {
    // ARRANGE
    CrowFunding crowFunding = new CrowFunding();
    // ACT and ASSERT
    Assert.equal(crowFunding.raised(), 0, 
                   "Initial raised amount is different than 0");
    //ARRANGE
    uint amount1 = 10 gwei;
    uint amount2 = 20 gwei;
    uint amountSuma = amount1 + amount2;
    // ACT
    crowFunding.donate{value:amount1}();
    crowFunding.donate{value:amount2}();
    // ASSERT
    Assert.equal(crowFunding.raised(), amountSuma, 
                   "Diference between raised amount and sum of donations");
  }
  
  // 5. comprobar el balance de nuestros donantes 
  function testTrackingDonorsBalance() public {
    // ARRANGE
    CrowFunding crowFunding = new CrowFunding();
    uint amount1 = 5 gwei;
    uint amount2 = 15 gwei;
    uint amountSuma = amount1 + amount2;
    
    // ACT
    crowFunding.donate{value:amount1}();
    crowFunding.donate{value:amount2}();
    
    // ASSERT
    Assert.equal(crowFunding.balances(address(this)),
                 amountSuma,
                 "Balance of the donator is different than sum of donations");
  }
 
  
}
