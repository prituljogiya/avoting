pragma solidity >=0.5.16;


contract Election {
    // Read/write candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store accounts that have voted
    mapping(address => bool) public voters;

    mapping(uint => Candidate) public candidates;

    // Store Candidates Count

     uint public candidatesCount;

    // Constructor

    constructor () public {

        addCandidate("candidate 1");
        addCandidate("candidate 2");
    } 
     function addCandidate (string memory _name) private {
       candidatesCount ++;
       candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
     }
   function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}