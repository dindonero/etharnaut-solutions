// SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;


interface Token {
    function transfer(address _to, uint _value) external returns (bool);
}

contract Tokenized {
    constructor() {
        Token token = Token(0x08083A992192d902d6f9D64Fd7338449780a759F);

        for(uint i = 0; i < 10; i++) {
            token.transfer()
        }
    }
}