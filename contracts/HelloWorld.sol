// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    // State variables
    string private text;
    address public owner;
    
    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Constructor to initialize the contract
    constructor() {
        text = "Hello World";
        owner = msg.sender;
    }

    // Public function to return the stored text
    function helloWorld() external view returns (string memory) {
        return text;
    }

    // Only the owner can set a new text value
    function setText(string calldata newText) external onlyOwner {
        text = newText;
    }

    // Only the owner can transfer ownership to a new address
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }
}
