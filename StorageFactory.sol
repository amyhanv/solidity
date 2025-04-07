// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./NumberStorage.sol";

contract StorageFactory {

    NumberStorage[] public storageArray;

    function createNumberStorages() public {
        NumberStorage numStore = new NumberStorage();
        storageArray.push(numStore);
    }

    function store(uint256 _index, uint256 _numberToStore) public {

        storageArray[_index].storeNum(_numberToStore);

    }

    function get(uint256 _index) public view returns(uint256) {

        NumberStorage numStore = storageArray[_index];
        return numStore.getNum();

    }
}

