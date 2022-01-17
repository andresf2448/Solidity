// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Change {
    int number1 = 5;
    
    function changeState(int number) public returns (int number2) {
        number1 = 6;
        number2 = number + number1;
    }
}