pragma solidity ^0.4.6; 

contract Voting {
  /* mapping is equivalent to an associate array or hash*/
  
  mapping (bytes32 => uint8) public votesReceived;
    
  bytes32[] public candidateList;        //Solidity doesn't let you create an array of strings yet. We will use an array of bytes32 instead 
  

  function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) returns (uint8) {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
