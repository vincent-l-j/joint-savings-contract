/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.8.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - A variable of type `uint256 public` named `lastWithdrawAmount`
    */
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint256 public lastWithdrawAmount;

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

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        // YOUR CODE HERE!
    }

    /// @notice show the balance of this contract
    /// @return balance the balance of this contract
    function getBalance() public view returns (uint256 balance) {
        return address(this).balance;
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    */
    // YOUR CODE HERE!
}
