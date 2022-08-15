
pragma solidity ^0.8.0;


interface Gatekeeper {
    function enter(bytes8 _gateKey) external returns (bool);
}


contract EntraATodaAForca {

    Gatekeeper gate;

    constructor() {
        gate = Gatekeeper(0x3404d3C438d56d7bB6fa003DD0cF595aC125F9ff);
    }

    function enter(bytes8 key, uint gas) public {
        gate.enter{gas: gas}(key);
    }

    function see(bytes8 key) public view returns (uint32, uint16, uint64) {
        return ( uint32(uint64(key)), uint16(uint64(key)), uint64(key)  );
    } 

    function checkgas() public view returns (uint) {
        uint gas = gasleft();
        require(address(this) == address(this));
        return gas - gasleft();
    }

}