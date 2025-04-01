// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;
contract Storage {

    uint256 helloWorld;

    function set(uint256 num) public {
        helloWorld = num;
    }

    function get() public view returns (uint256){
        return helloWorld;
    }
}