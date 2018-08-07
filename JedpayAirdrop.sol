pragma solidity ^0.4.11;

import "./JedpayToken.sol";


contract JedpayAirdrop {

    address public owner;
    address public tokenContractAddr;
    
    function JedpayAirdrop(address _tokenContractAddr) public {
        owner = msg.sender;
        tokenContractAddr = _tokenContractAddr;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function distribute(address[] dests)
    onlyOwner
    returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
            JED(tokenContractAddr).transfer(dests[i], 100 ether);
            i += 1;
        }
        return(i);
    }
}