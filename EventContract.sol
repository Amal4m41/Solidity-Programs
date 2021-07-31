pragma solidity>=0.5.0;   //declare the version

//to buy tokens using a function with ether and transfering that ether to wallet account.
contract MyContract{
    mapping(address => uint256) public balanceRecord;
    address payable wallet; //whenever we declare a address variable that can accept ether inside of 
    //a contract we need to add "payable" to it.
    
    event Purchase(  //declaring an event.
      address _buyer,
      uint256 _amount  
    );
    
    constructor(address payable _wallet) {
        wallet=_wallet;
    }
    
    // fallback() external payable{  //external functions can only be called from the outside of this contract, i.e. 
    // //it's just like pubic but can't be called within the contract.
    
    //      // This function is called for all messages sent to
    //      // this contract, except plain Ether transfers
    //      // (there is no other function except the receive function).
    //      // Any call with non-empty calldata to this contract will execute
    //      // the fallback function (even if Ether is sent along with the call).
       
    //     buyToken();
    // }
    
    function buyToken() public payable{  //inorder for this function to accept the ether values,
    //we have to use the "payable" modifier
    
        //buy a token
        balanceRecord[msg.sender]+=1; //msg.sender gives the address of the caller of this function.
        
        //send the ether input for the function to the wallet
        wallet.transfer(msg.value); //msg.value gives the amount of ether send by the caller of the
        //function.
        
        emit Purchase(msg.sender, 1);  //trigger the event.
    }
}