var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
    var electionInstance;
  
    it("Zero vote counts total to start", function() {
      return Election.deployed().then(function(instance) {
        return instance.totalVotes();
      }).then(function(count) {
        assert.equal(count, 0);
      });
    });
})