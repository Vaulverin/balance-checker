// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.2 <0.9.0;

// ERC20 contract interface
interface Token {
  function balanceOf(address) external view returns (uint);
}

contract BalanceChecker {
  /* Fallback function, don't accept any ETH */
  receive() external payable {
    revert("BalanceChecker does not accept payments");
  }


  /*
    Check the token balances of a wallet for multiple tokens.
    Pass 0x0 as a "token" address to get ETH balance.

    Possible error throws:
      - extremely large arrays for user and or tokens (gas cost too high) 
          
    Returns a one-dimensional that's user.length * tokens.length long. The
    array is ordered by all of the 0th users token balances, then the 1th
    user, and so on.
  */
  function balances(address[] calldata users, address[] calldata tokens) external view returns (uint[] memory) {
    uint[] memory addrBalances = new uint[](tokens.length * users.length);
    
    for(uint i = 0; i < users.length; i++) {
      for (uint j = 0; j < tokens.length; j++) {
        uint addrIdx = j + tokens.length * i;
        if (tokens[j] != address(0x0)) { 
          addrBalances[addrIdx] = Token(tokens[j]).balanceOf(users[i]);
        } else {
          addrBalances[addrIdx] = users[i].balance; // ETH balance    
        }
      }  
    }
  
    return addrBalances;
  }

}