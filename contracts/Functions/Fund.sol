// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Fund {
    //payable se utiliza cunaod necesitamos enviar ether a alguna dirección de la blockchain dentro de una función
    function sendEther(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }
}