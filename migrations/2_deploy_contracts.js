var BlockVote = artifacts.require("BlockVote");

module.exports = function(deployer) {
  deployer.deploy(BlockVote, "Best rapper of all time?");
};
