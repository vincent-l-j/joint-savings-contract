# Joint Savings Account

![alt=“”](image/20-5-challenge-image.png)

## Background

[joint_savings.sol](src/joint_savings.sol) is a Solidity smart contract that creates a joint account from two user addresses.
Only these addresses will be able to control the joint savings account.
The smart contract allows the joint account owners to deposit and withdraw funds from the account.

## Results

### Test Functionality

#### Before contract is deployed

![alt="Before contract deployment"](Execution_Results/00_before_contract_creation.png)

#### Contract creation

![alt="Set account values"](Execution_Results/01_contract_deployed.png)

#### Set account values

![alt="Set account values"](Execution_Results/02_setAccounts.png)

#### Send 1 ETH as wei

![alt="Send 1 ETH as wei from account 1"](Execution_Results/03_deposit_1_ETH_from_account1.png)

#### Get Balance

![alt="Show balance of 1 ETH"](Execution_Results/04_balance_1_ETH.png)

#### Send 10 ETH as wei

![alt="Send 10 ETH as wei from account 2"](Execution_Results/05_deposit_10_ETH_from_account2.png)

#### Get Balance

![alt="Show balance of 11 ETH"](Execution_Results/06_balance_11_ETH.png)

#### Send 5 ETH as wei

![alt="Send 5 ETH as wei from account 1"](Execution_Results/07_deposit_5_ETH_from_account1.png)

#### Get Balance

![alt="Show balance of 16 ETH"](Execution_Results/08_balance_16_ETH.png)

####  Withdraw 5 ETH into account 1

![alt="Withdraw 5 ETH into account 1"](Execution_Results/09_withdraw_5_ETH_to_account1.png)

####  Get Balance, last to withdraw, last withdraw amount

![alt="Show balance of 11 ETH, lastToWithdraw and lastWithdrawAmount"](Execution_Results/10_balance_11_ETH_and_last_withdraw.png)

#### Withdraw 10 ETH into account 2

![alt="Withdraw 10 ETH into account 2"](Execution_Results/11_withdraw_10_ETH_to_account2.png)

#### Get Balance, last to withdraw, last withdraw amount

![alt="Show balance of 1 ETH, lastToWithdraw and lastWithdrawAmount"](Execution_Results/12_balance_1_ETH_last_withdraw.png)


### Security Checks

#### Check that other accounts cannot setAccounts

![alt="only joint owners can use setAccounts"](Execution_Results/13_setAccounts_permissions.png)

#### Check that other accounts cannot withdraw

![alt="only joint owners can withdraw"](Execution_Results/14_withdraw_permissions.png)

#### Check that the owners cannot set an account to the zero address (0x0000000000000000000000000000000000000000)

![alt="joint owners cannot set an account address to the zero address"](Execution_Results/15_zero_address.png)

#### Check that the owners cannot withdraw more than the max funds

![alt="withdraw function requires sufficient funds before withdrawing"](Execution_Results/16_insufficient_funds.png)
