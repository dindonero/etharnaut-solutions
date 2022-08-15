// SPDX-License-Identifier: MIT

// didn't get it
pragma solidity ^0.5.0;

contract AlienCodex {

    address public _owner;
  bool public contact;
  bytes32[] public codex;

  constructor() public {
      _owner = 0xb8558fba797321E4fF69a772664Da86B8C9fB0A3;
  }

  modifier contacted() {
    assert(contact);
    _;
  }
  
  function make_contact() public {
    contact = true;
  }

  function record(bytes32 _content) contacted public {
  	codex.push(_content);
  }

  function retract() contacted public {
    codex.length--;
  }

  function revise(uint i, bytes32 _content) contacted public {
    codex[i] = _content;
  }
}

contract Alienated {

    AlienCodex public a;

    constructor(address alien) public {
        a = AlienCodex(alien);
    }

    function make_contact() public {
        a.make_contact();
    }

}