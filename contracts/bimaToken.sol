// SPDX-License-Identifier: MIT

// Smart contract for lottery
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BimaToken {

    address payable owner;
    address payable receiver;

    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Deposit(address sender, uint value);
    event Withdraw(address sender, address receiver, uint value);


  

    function withdraw() public payable onlyOwner {
        (bool sent, bytes memory data) = receiver.call{value: balances[msg.sender]}("");
        require(sent, "Failed to send funds to receiver");
        emit Transfer(msg.sender, receiver, balances[msg.sender]);        
    }

    function transfer(address to, address from, uint256 value) public payable onlyOwner returns (bool success){

        require(balances[msg.sender] < value, "Not enough balance");

        balances[msg.sender] -= value;

        balances[to] += value;

        emit Transfer(msg.sender, to, value);

        return true;

    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool) {
        require(allowed[_from][msg.sender] >= _value, "Insufficient allowance");
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);
        return true;
    }


}
