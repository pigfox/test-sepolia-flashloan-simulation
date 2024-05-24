// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title Vault
 * @dev A simple vault where funds can be deposited and withdrawn
 */
contract Vault {
    // Event that logs the deposit done
    event Deposited(address indexed sender, uint amount);

    // Event that logs the withdrawal done
    event Withdrawn(address indexed to, uint amount);

    /**
     * @dev Deposits Ether into the contract.
     */
    receive() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @dev Withdraws Ether from the contract to a specified address.
     * @param _to The address to send Ether to.
     * @param _amount The amount of Ether to send.
     */
    function withdraw(address payable _to, uint _amount) external {
        require(address(this).balance >= _amount, "Insufficient balance in vault");
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        emit Withdrawn(_to, _amount);
    }

    /**
     * @dev Returns the balance of Ether stored in the contract.
     * @return The balance of Ether.
     */
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
