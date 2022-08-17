// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./IERC20.sol";

// smart contract that allow users to swap between two tokens;
// and keeps an order book
contract Swap {

    address payable public seller;
    address payable public buyer;
    address payable public arbiter;
    uint public orderCount;
    // mapping (address => Order) orderBook;
    // mapping(address => mapping (address => uint256)) rates;
    Order[] public orderBook;

    struct Order {
        uint amount;
        address tokenSwap;
        address tokenReceive;
        uint deadline;
    }

    constructor(address payable _arbiter) public {
        arbiter = _arbiter;
    }

    function createOrder (
        address _seller,
        uint _amount,
        address _tokenSwap,
        address _tokenReceive,
        uint _deadline
    ) external onlyOwner {
        require(msg.sender == seller, "Only Seller can call");
        require(_token1 != 0, "cannot be zero");

        orderBook.push(Order(
            address _tokenSwap,
            address _tokenReceive,
            uint _deadline
            ));
        
        uint rate = _amount/100 * 2;
        _amount = _amount + rate;

        _token1.transfer(address(this).balance);
    }


   function acceptSwap(uint index) external returns(bool) {
        require(msg.sender == buyer, "Only Seller can call");
        require(msg.sender === onlyOwner, "NOT OWNER!")

        orderBook[index]
        
        buyer.transferFrom(_buyer, arbiter, amount);
    }

    function releaseToken() {
        require(msg.sender === arbiter)

        seller.transferFrom(_buyer, arbiter, amount);
    }

}
