// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    struct Project{
        string id;
        string name;
        string description;
        address payable author;
        uint state;
        uint funds;
        uint fundraisingGoal;
    }

    Project public project;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        project = Project(_id, _name, _description, payable(msg.sender), 0, 0, _fundraisingGoal);
    }

    modifier sendProject() {
        require(
            project.author != msg.sender,
            "author does not send money"
        );
        _;
    }

    event MoneyRecieveEvent(
        address userDonator,
        uint quantityFunds
    );

    function fundProject() public payable sendProject {
        require(
            project.state != 0,
            "smart contract closed"
        );

        require(
            msg.value != 0,
            "invalid quantity"
        );

        project.author.transfer(msg.value);
        project.funds += msg.value;

        emit MoneyRecieveEvent(msg.sender, msg.value);
    }

    event ChangeStatusEvent(
        uint newvalue
    );

    modifier stateProject() {
        require(
            project.author == msg.sender,
            "Only author can change the state"
        );
        _;
    }

    function changeProjectState(uint newState) public stateProject{
        require(
            newState != project.state,
            "invalid state"
        );

        project.state = newState;

        emit ChangeStatusEvent(newState);
    }
}