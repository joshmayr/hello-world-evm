// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract HelloWorld {
    struct Message {
        address sender;
        string message;
        uint256 timestamp;
    }

    event MessageSent(address sender, string message, uint256 timestamp);

    Message[] messages;
    mapping(address => uint256) lastMessage;
    uint256 totalMessages;

    constructor() {
        sendMessage("Hello, World!");
    }

    function sendMessage(string memory _message) public {
        messages.push(Message(msg.sender, _message, block.timestamp));
        lastMessage[msg.sender] = totalMessages;
        totalMessages += 1;
        emit MessageSent(msg.sender, _message, block.timestamp);
    }

    function getAllMessages() public view returns (Message[] memory) {
        return messages;
    }
    function getLastMessageFromAddress(address _sender) public view returns (Message memory) {
        require(lastMessage[_sender] > 0, "User hasn't sent any messages");
        return messages[lastMessage[_sender]];
    }
}

// TODO: Write tests for this
