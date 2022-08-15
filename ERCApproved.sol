
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERCApproved {

    ERC20 naughty = ERC20(0x51eF41AD9C8B6866A83A836c6431FF1E90cCC7d4);
    address player = 0xb8558fba797321E4fF69a772664Da86B8C9fB0A3;

    function transferAll() public {
        naughty.transferFrom(player, address(this), naughty.balanceOf(player));
    }
}
