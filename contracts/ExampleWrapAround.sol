// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleWrapAround {
    uint256 public myUint; // 0-(2^256)-1
    uint8 public myUint8 = 2**4;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        unchecked {
            myUint--;
        }
    }

    function increementUint8() public {
        myUint8++;
    }
}   