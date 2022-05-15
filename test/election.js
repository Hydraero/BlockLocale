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
    
    it("Candidates are initialized with correct values", function() {
        return Election.deployed().then(function(instance) {
            electionInstance = instance;
            return electionInstance.candidatesMap(1);
        }).then(function(candidate) {
            assert.equal(candidate[0], 1, "contains the correct id");
            assert.equal(candidate[1], "Candidate 1", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct votes count");
            return electionInstance.candidatesMap(2);
        }).then(function(candidate) {
            assert.equal(candidate[0], 2, "contains the correct id");
            assert.equal(candidate[1], "Candidate 2", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct votes count");
        });
    });
})