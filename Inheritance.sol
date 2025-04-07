// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

import "./NumberStorage.sol";

contract DoubleNumber is NumberStorage {
    // Inherites the Library contract and doubles the number

    uint256 doubleNumber;

    function storeNum(uint256 _number) public override {
       doubleNumber = _number * 2;

    }

    function getNum() public view override returns (uint256)  {
       return doubleNumber;

    }

}
