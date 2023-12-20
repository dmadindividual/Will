// SPDX-License-Identifier: MIT
// The SPDX-License-Identifier is a way to declare the license under which the smart contract is released.

pragma solidity ^0.8.13;
// Specifies the version of the Solidity compiler that should be used for compilation.

contract Will {
    // Definition of the Will smart contract

    address Lawyer; // Address of the lawyer who manages the will
    uint balance; // Current balance in the will
    bool Unalived; // Flag indicating whether the person has passed away
    address payable[] public Family; // Array to store addresses of family members
    mapping(address => uint) public FamilyInhereitance; // Mapping to store inheritance amounts for each family member

    constructor() payable {
        // Constructor function executed only once during deployment
        Lawyer = msg.sender; // The person deploying the contract is set as the lawyer
        balance = msg.value; // Initial balance is set to the value sent with the deployment transaction
        Unalived = false; // Initially, the person is considered alive
    }

    modifier OnlyLawyer() {
        // Modifier to restrict access to only the lawyer
        require(Lawyer == msg.sender, "Only The Lawyer can make this call");
        _; // Continue with the function if the condition is met
    }

    modifier isDead() {
        // Modifier to set the Unalived flag to true
        Unalived = true;
        _; // Continue with the function if the condition is met
    }

    function AllocateFunds(address payable _receivers, uint _amount) public payable OnlyLawyer {
        // Function to allocate funds to a family member
   
        balance = _amount; // Update the balance to the specified amount

        Family.push(_receivers); // Add the family member's address to the Family array
        FamilyInhereitance[_receivers] = _amount; // Set the inheritance amount for the family member
    }

    function SendFunds() private OnlyLawyer isDead {
        // Private function to send funds to family members, can only be called by the lawyer and after the person has passed away
        for (uint i = 0; i < Family.length; i++) {
            Family[i].transfer(FamilyInhereitance[Family[i]]); // Transfer the inheritance amount to each family member
        }
    }

    function PayoutFunds() public OnlyLawyer isDead {
        // Public function to initiate the fund transfer, can only be called by the lawyer and after the person has passed away
        SendFunds(); // Call the private SendFunds function to transfer funds to family members
    }
}
