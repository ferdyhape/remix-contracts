// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract PurchaseTransaction {
    address public owner;

    struct Transaction {
        uint256 transactionId;
        uint256 rupiahAmount;
        string buyer; // Mengubah tipe data dari address menjadi string
        string productName;
        uint256 quantity;
        uint256 price;
    }

    mapping(uint256 => Transaction) public transactions;
    uint256 public transactionCount;

    event TransactionAdded(uint256 transactionId, uint256 rupiahAmount, string buyer, string productName, uint256 quantity, uint256 price);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addTransaction(uint256 _rupiahAmount, string memory _buyer, string memory _productName, uint256 _quantity, uint256 _price) public onlyOwner {
        transactionCount++;
        transactions[transactionCount] = Transaction(transactionCount, _rupiahAmount, _buyer, _productName, _quantity, _price);
        emit TransactionAdded(transactionCount, _rupiahAmount, _buyer, _productName, _quantity, _price);
    }
}
