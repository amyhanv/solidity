// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract NumberStorage {

    uint256 myNumber;

    function storeNum(uint256 _number) public virtual {
        myNumber = _number;
    }

    function getNum() public view virtual returns (uint256) {
        return myNumber;
    }

}
