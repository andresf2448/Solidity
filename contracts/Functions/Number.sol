// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Number {
    function getNumber() public pure returns (int256 number) {
        number = 1948;
    }

    function changeNumber() private pure returns (int256 number) {
        number = getNumber() * -1;
    }
}