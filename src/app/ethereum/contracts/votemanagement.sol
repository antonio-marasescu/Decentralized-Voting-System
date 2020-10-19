pragma solidity >=0.5.0 <0.6.0;

import "./ownable.sol";


contract VoteManagement is Ownable {
    event IssuerAdded(address indexed issuer);
    event CandidateAdded(address indexed issuer);

    mapping(address => bool) public isIssuer;
    mapping(address => bool) public isCandidate;
    address[] issuers;
    address[] candidates;

    modifier onlyIssuer(){
        require(isIssuer[msg.sender] == true);
        _;
    }

    function addIssuer(address _issuer) public onlyOwner {
        isIssuer[_issuer] = true;
        issuers.push(_issuer);
        emit IssuerAdded(_issuer);
    }

    function addCandidate(address _candidate) public onlyOwner {
        isCandidate[_candidate] = true;
        candidates.push(_candidate);
        emit CandidateAdded(_candidate);
    }

    function getIssuers() external view returns (address[] memory){
        return issuers;
    }

    function getCandidates() external view returns (address[] memory){
        return candidates;
    }
}
