pragma solidity>=0.5.0;   //declare the version

//to buy tokens using a function with ether and transfering that ether to wallet account.
contract ERC20Token{
    // string public name;
    mapping(address => uint256) public balanceRecord;
    
    function mint() public{
        
        //VERY IMPORTANT
        // balanceRecord[msg.sender]+=1;  //if we do using this way(using msg.sender) then the address it'll use as key is the
        //address of the contract from which we call this function and not the address using which we call the function of the
        //the other contract. Therefore we'll have to use tx.origin.
        balanceRecord[tx.origin]+=1;
    }
}
contract MyContract{

    address payable wallet; 
    address public tokenContract;  //to store the address where the ERC20Token is stored/deployed.(we first deplay the 
    //ERC20Token and then get it's address where it's stored and pass it to this contract's constructor).
    
    constructor(address payable _wallet,address _token) {
        wallet=_wallet;
        tokenContract=_token;
    }
    
    function buyToken() public payable{  //inorder for this function to accept the ether values,
    //we have to use the "payable" modifier
    
        //buy a token
        ERC20Token erc20TokenReference = ERC20Token(address(tokenContract)); //get the reference of the contract using it's 
        //deployed address.
        
        erc20TokenReference.mint(); //call the function to add token.
        
        //send the ether input for the function to the wallet
        wallet.transfer(msg.value); 

    }
}