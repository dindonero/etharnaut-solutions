

interface LostToken {
    function destroy(address payable _to) external;
}

contract EasyRecovery {

    LostToken token = LostToken(0xB3130374a5A9358007bB0B00ab03B144092fB9aa);

    address player = 0xb8558fba797321E4fF69a772664Da86B8C9fB0A3;

    constructor() {
        token.destroy(payable(player));
    }

}