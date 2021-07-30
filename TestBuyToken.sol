pragma solidity>=0.5.0;   //declare the version

//to buy tokens using a function with ether and transfering that ether to wallet account.
contract TestBuyToken{
    mapping(address => uint256) public balanceRecord;
    address payable wallet; //whenever we declare a address variable that can accept ether inside of 
    //a contract we need to add "payable" to it.
    
    constructor(address payable _wallet){
        wallet=_wallet;
    }
    
    
    function buyToken() public payable{  //inorder for this function to accept the ether values,
    //we have to use the "payable" modifier
    
        //buy a token
        balanceRecord[msg.sender]+=1; //msg.sender gives the address of the caller of this function.
        
        //send the ether input for the function to the wallet
        wallet.transfer(msg.value); //msg.value gives the amount of ether send by the caller of the
        //function.
    }
}