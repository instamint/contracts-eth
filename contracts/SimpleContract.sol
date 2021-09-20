// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract SimpleContract {
    uint value;

    function setValue(uint _value) external {
        value = _value;
    }

    function getValue() external view returns(uint) {
        return value;
    }
}
