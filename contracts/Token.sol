// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    struct Stock {
        string companyName;
        uint256 tokenValue;
    }

    mapping(address => Stock) public stocks;

    function setStock(string memory _companyName, uint256 _tokenValue) public {
        stocks[msg.sender] = Stock(_companyName, _tokenValue);
    }

    function getCompanyName(
        address _owner
    ) public view returns (string memory) {
        return stocks[_owner].companyName;
    }

    function getTokenValue(address _owner) public view returns (uint256) {
        return stocks[_owner].tokenValue;
    }
}
