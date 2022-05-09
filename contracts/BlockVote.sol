pragma solidity ^0.4.21;
contract Election {

    struct Candidate {
        string candidateName;
        uint voteCount;

    }

    struct Voter {
        bool authorized;                                //check if voter/user is authorized
        bool voted;                                     //check if voter/user has voted
        uint vote;                                      //checks who voters voted for
    }

    address public owner;                               //owner of the contract
    string public electionName;             

    mapping(address => Voter) public voters;            //keeps tracks of voters
    Candidate[] public candidates;                      //array of candidates to be voted for
    uint public totalVotes;

    modifier ownerOnly() {                              //modifier to allow owner only functionalities (used in functions)
        require(msg.sender == owner);
        _;                                              //executes everything in the function if requirement (is owner) is met;         
    }

    constructor(string _name) public {
        owner = msg.sender;                             //the (address) owner of the contract (whoever deployed the contract) also owns the Election
        electionName = _name;
    }
    
    function addCandidate(string _name) ownerOnly public {
        candidates.push(Candidate(_name, 0));
    }
    /*
    function getNumCandidate() public view returns(uint) {
        return candidates.length;
    }
    */
    function authorize(address _user) ownerOnly public {
        voters[_user].authorized = true;
    }

    function vote(uint _candidateVoteIndex) public {
        require(!voters[msg.sender].voted);             // requires user to have not voted yet
        require(voters[msg.sender].authorized);

        voters[msg.sender].vote = _candidateVoteIndex;
        voters[msg.sender].voted = true;                 //marks the voter as already having voted

        candidates[_candidateVoteIndex].voteCount += 1;
        totalVotes += 1;
    }

    function end() ownerOnly public{
        selfdestruct(owner);
    }
}