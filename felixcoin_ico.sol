// Felixcoin ICO

pragma solidity ^0.8.19;

contract felixcoin_ico {

    // Introducing the maximum number of Felixcoins available for sale
    uint public max_felixcoins = 1000000;

    // Introducing the USD to Felixcoins conversion rate
    uint public usd_to_felixcoins = 1000;

    // Introducing the total number of Felixcoins that have been bought by the investors
    uint public total_felixcoins_bought = 0;

    // Mapping from the investor address to its equity in Felixcoins and USD
    mapping(address => uint) equity_felixcoins;
    mapping(address => uint) equity_usd;

    // Check if an investor can buy Felixcoins
    modifier can_buy_felixcoins(uint usd_invested) {
        require (usd_invested * usd_to_felixcoins + total_felixcoins_bought <= max_felixcoins);
        _;
    }

    // Getting the equity in Felixcoins of an investor
    function equity_in_felixcoins(address investor) external constant returns (uint) {
        return equity_felixcoins[investor];
    }

    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }

    // Buying Felixcoins
    function buy_felixcoins(address investor, uint usd_invested) external
    can_buy_felixcoins(usd_invested) {
        uint felixcoins_bought = usd_invested * usd_to_felixcoins;
        equity_felixcoins[investor] += felixcoins_bought;
        equidty_usd[investor] = equity_felixcoins[investor] / usd_to_felixcoins;
        total_felixcoins_bought += felixcoins_bought;
    }

    // Selling Felixcoins
    function sell_felixcoins(address investor, uint felixcoins_to_sell) external {
        equity_felixcoins[investor] -= felixcoins_to_sell;
        equidty_usd[investor] = equity_felixcoins[investor] / usd_to_felixcoins;
        total_felixcoins_bought -= felixcoins_to_sell;
    }
}