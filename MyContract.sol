pragma solidity>=0.5.0;   //declare the version
/*

* Smart contract is just a code that executed on the blockchain.
* We use solidity to write Ethereum smart contracts for the Ethereum blockchain
* This smart contract is accessable to everyone on the blockchain, they'll be able to see this 
smart contract, read and write data with it, execute any code that is written here; So it's public.
* Solidity is a contract oriented, statically typed language.

*/
contract MyContract{
    string public value;    //value that is stored on the blockchain storage.
    //if we set value for this varialbe, we're writing data onto the blockchain.
    //this is different from a local variable that we define inside a function, which will disappear
    //once function call is removed from the stack.
    //Making the state variable public gives us a value() function to access it's value.
    
    constructor(){ //called the first time when the contact is deployed.
        value="Messi is the GOAT";
    }
    
    // function getValue() public view returns(string memory){  //public tells that we can access this function outside the contract scope
    //     //since we're not changing any value inside this function we need to add "view" modifier
        
    //     return value;
    // }
    
    function setValue(string memory _value) public{
        value=_value;
    }
}