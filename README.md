# Will Smart Contract

## Overview

This is a simple Ethereum smart contract designed to manage a will. The contract allows a lawyer to allocate funds to specified family members and distribute the inheritance according to the specified amounts upon the person's demise.

## Features

- **Allocation of Funds**: The lawyer can allocate funds to family members.
- **Distribution of Inheritance**: After the person's demise, the lawyer can initiate the distribution of funds to family members.
- **Security**: Access control mechanisms ensure that only the designated lawyer can perform critical actions.

## Smart Contract Details

- **Lawyer**: The address of the lawyer managing the will.
- **Balance**: Current balance in the will.
- **Unalived**: A flag indicating whether the person has passed away.
- **Family**: An array storing addresses of family members.
- **FamilyInhereitance**: A mapping to store inheritance amounts for each family member.

## Deployment

The smart contract is deployed on the Ethereum blockchain using Solidity version 0.8.13. The initial balance and lawyer are set during deployment.

## Usage

1. **Allocation of Funds**: The lawyer can use the `AllocateFunds` function to allocate funds to family members. The function can only be called by the lawyer.

    ```solidity
    function AllocateFunds(address payable _receivers, uint _amount) public payable OnlyLawyer
    ```

2. **Distribution of Inheritance**: After the person's demise, the lawyer can use the `PayoutFunds` function to initiate the distribution of funds to family members. The function can only be called by the lawyer.

    ```solidity
    function PayoutFunds() public OnlyLawyer isDead
    ```



## License

This smart contract is released under the [MIT License](LICENSE).

Feel free to customize this README based on the specifics of your project and any additional information you want to provide to users and developers.
