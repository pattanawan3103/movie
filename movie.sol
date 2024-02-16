// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract ProofOfPurchase {  

  mapping (bytes32 => bool) private purchasedMovies;

  // store the proof for a movie purchase in the contract state
  function recordPurchase(bytes32 proof) private {
    purchasedMovies[proof] = true;
  }
  
  // record a movie purchase
  function purchaseMovie(string memory movieTitle) public {
    recordPurchase(hashing(movieTitle));
  }
  
  // SHA256 for Integrity
  function hashing(string memory movieTitle) private 
  pure returns (bytes32) {
    return sha256(bytes(movieTitle));
  }
  
  // check if a movie has been purchased
  function checkMoviePurchase(string memory movieTitle) public 
  view returns (bool) {
    return purchasedMovies[hashing(movieTitle)];
  }
}
