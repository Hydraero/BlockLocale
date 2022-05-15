pragma solidity ^0.8.12;
contract Election {
    
    struct Candidate {
        uint candidateID;
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

    mapping(address => Voter) public voters;            //keeps track of voters
    mapping(uint => Candidate) public candidatesMap;       //stores/keeps track candidates
    Candidate[] public candidates;                      //array of candidates to be voted for
    uint public totalVotes;                             //Stores total votes
    uint public candidatesCount;                        //Stores candidates count

    modifier ownerOnly() {                              //modifier to allow owner only functionalities (used in functions)
        require(msg.sender == owner);
        _;                                              //executes everything in the function if requirement (is owner) is met;         
    }

    //Temporary constructor
    constructor() public {
        
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    /* Will use this instead of above constructor 
    //smart contract constructor
    constructor(string memory _name) public {
        owner = msg.sender;                             //the (address) owner of the contract (whoever deployed the contract) also owns the Election
        electionName = _name;
    }
    */
    //temporary addCandidate function
    function addCandidate(string memory _name) public {
        candidatesCount ++;
        candidates.push(Candidate(candidatesCount,_name, 0));
        candidatesMap[candidatesCount] = Candidate(candidatesCount,_name, 0);           //Update later
    }
    /*
    //add candidate function
    function addCandidate(string memory _name) ownerOnly public {
        candidatesCount ++;
        candidates.push(Candidate(candidatesCount,_name, 0));
        candidatesMap[candidatesCount] = Candidate(candidatesCount,_name, 0);           //Update later
    }
    */
    //Allows owner only privileges
    function authorize(address _user) ownerOnly public {
        voters[_user].authorized = true;
    }

    function vote(uint _candidateID) public {
        require(!voters[msg.sender].voted);             // requires user to have not voted yet
        require(voters[msg.sender].authorized);

        voters[msg.sender].vote = _candidateID;
        voters[msg.sender].voted = true;                 //marks the voter as already having voted

        candidatesMap[_candidateID].voteCount ++;
        totalVotes ++;
    }
    /* Deprecated function
    function end() ownerOnly public{
        selfdestruct(owner);
    }
    */


}