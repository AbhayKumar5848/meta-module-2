// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Public variables to store the details about the coin
    string public name;
    string public symbol;
    uint256 public totalSupply = 0;

    // Mapping to store the balance of each address
    mapping(address => uint256) public balances;

    // Constructor to initialize the token details
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        // Optionally, you can assign an initial supply to the contract deployer if needed
        // balances[msg.sender] = initialSupply; 
        // totalSupply = initialSupply;
    }

    // Mint function to increase total supply and balance of the receiver
    function mint(address _to, uint256 _value) public {
        totalSupply += _value;
        balances[_to] += _value;
    }

    // Burn function to decrease total supply and balance of the sender
    function burn(address _from, uint256 _value) public {
        require(balances[_from] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_from] -= _value;
    }
}
