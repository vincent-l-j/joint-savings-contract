// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JointSavings {

    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint256 public lastWithdrawAmount;

    /// @dev Initializes the contract setting the deployer as the initial owner.
    constructor() {
        accountOne = payable(msg.sender);
        accountTwo = payable(msg.sender);
    }

    /// @notice Withdraw funds to an account
    /// @param amount The amount (in wei) to withdraw
    /// @param recipient address to which the funds should be transferred
    function withdraw(uint amount, address payable recipient) public {

        /*
        Ensure the `recipient` is equal to either `accountOne` or `accountTwo`.
        The `require` statement returns the text `"You don't own this account!"` if it does not.
        */
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        /*
        Ensure the `balance` is sufficient to accomplish the withdraw operation.
        If there are insufficient funds, the text `Insufficient funds!` is returned.
        */
        require(address(this).balance >= amount, "Insufficient funds!");

        /*
        Check if the `lastToWithdraw` is not equal to (`!=`) to `recipient`.
        If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }

        // Set  `lastWithdrawAmount` equal to `amount`
        lastWithdrawAmount = amount;

        // Withdraw the specified amount to the recipient address.
        recipient.transfer(amount);
    }

    /// @notice This function takes the amount to be transferred as a parameter and then checks if that's the actual amount transferred. This allows the contract to reject transactions that may be erroneous
    /// @param amount The amount in wei to be transferred.
    function deposit(uint256 amount) public payable {
        // Ensure the amount specified matches the amount attached to the transaction
        require(msg.value == amount, "Attached amount doesn't match the stated deposit amount");
    }

    /// @notice Set the two accounts which are able to withdraw from this smart contract. They could be the same account but that defeats the purpose of this contract.
    /// @dev WARNING! Still needs a check to ensure that only the owner of this contract can use this function.
    /// @param account1 The address of one of the owners of this joint account
    /// @param account2 The address of the other owner of this joint account
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        accountOne = account1;
        accountTwo = account2;
    }

    /// @notice show the balance of this contract
    /// @return balance the balance of this contract
    function getBalance() public view returns (uint256 balance) {
        return address(this).balance;
    }

    /// @notice The receive function is executed on a call to the contract with empty calldata. This is the function that is executed on plain Ether transfers (e.g. via .send() or .transfer()).
    receive() external payable { }

    /// @notice The fallback function is executed on a call to the contract if no other functions match the given function signature, or if no data was supplied at all and there is no receive Ether function.
    fallback() external payable { }
}
