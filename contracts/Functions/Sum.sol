// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Sum {
    //view para decir que lka función no puede modificar ni leer las variables de estado
    int number = 100;

    function sum(int a, int b) public pure returns (int result) {
        result = a + b;
    }
}