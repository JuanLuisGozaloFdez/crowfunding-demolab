const ConvertLib = artifacts.require("ConvertLib");
const CrowFunding = artifacts.require("CrowFunding");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, CrowFunding);
  deployer.deploy(CrowFunding);
};
