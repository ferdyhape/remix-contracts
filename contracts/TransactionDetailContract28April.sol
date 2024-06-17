// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract TransactionDetailContract {
    struct TransactionDetail {
        string transactionCode;
        uint256 price;
        string token;
        uint createdAt;
    }

    event TransactionDetailAdded(
        string transactionCode,
        uint256 price,
        string token,
        uint createdAt
    );

    mapping(uint => TransactionDetail) public transactionDetails;
    uint public transactionDetailCount;

    function addTransactionDetail(
        string[] memory _transactionCode,
        uint256[] memory _price,
        string[] memory _token,
        uint[] memory _createdAt
    ) public {
        require(
            _transactionCode.length == _price.length &&
                _price.length == _token.length &&
                _token.length == _createdAt.length,
            "Lengths of input arrays do not match"
        );

        for (uint i = 0; i < _transactionCode.length; i++) {
            transactionDetailCount++;
            transactionDetails[transactionDetailCount] = TransactionDetail(
                _transactionCode[i],
                _price[i],
                _token[i],
                _createdAt[i]
            );

            emit TransactionDetailAdded(
                _transactionCode[i],
                _price[i],
                _token[i],
                _createdAt[i]
            );
        }
    }

    function getAllTransactionDetail()
        public
        view
        returns (TransactionDetail[] memory)
    {
        TransactionDetail[] memory result = new TransactionDetail[](
            transactionDetailCount
        );
        for (uint i = 1; i <= transactionDetailCount; i++) {
            result[i - 1] = transactionDetails[i];
        }
        return result;
    }

    function getTransactionDetailByTransactionCode(
        string memory _transactionCode
    ) public view returns (TransactionDetail[] memory) {
        uint count = 0;
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                count++;
            }
        }

        TransactionDetail[] memory result = new TransactionDetail[](count);
        uint index = 0;
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                result[index] = transactionDetails[i];
                index++;
            }
        }
        return result;
    }

    function getPriceFromTransactionDetailByTransactionCode(
        string memory _transactionCode
    ) public view returns (uint256[] memory) {
        uint count = 0;
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                count++;
            }
        }

        uint256[] memory prices = new uint256[](count);
        uint index = 0;
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                prices[index] = transactionDetails[i].price;
                index++;
            }
        }
        return prices;
    }

    function getCountTransactionDetailByTransactionCode(
        string memory _transactionCode
    ) public view returns (uint256) {
        uint count = 0;
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                count++;
            }
        }
        return count;
    }

    function getTransactionDetailByCode(
        string memory _transactionCode
    ) public view returns (TransactionDetail memory) {
        for (uint i = 1; i <= transactionDetailCount; i++) {
            if (
                keccak256(
                    abi.encodePacked(transactionDetails[i].transactionCode)
                ) == keccak256(abi.encodePacked(_transactionCode))
            ) {
                return transactionDetails[i];
            }
        }
        revert("Transaction detail not found");
    }
}
