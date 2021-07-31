pragma solidity>=0.5.0;   //declare the version

//Inheritance in contracts.
contract ERC20Token{
    string public name;
    mapping(address => uint256) public balanceRecord;
    
    constructor(string memory _name){
        name=_name;
    }
    
    function mint() virtual public{ //virtual means this base class function can be overridden by child classes.
        balanceRecord[tx.origin]+=1;
    }
}

contract MyToken is ERC20Token{  //if we want to use this contract, just deploy this contract(deploying the parent contract is not neccesary).
    // string public name="My Token!";  //overriding the parent variable.
    string public symbol;
    address[] public tokenOwners; //to store the addresses who owns the tokens.
    uint256 public countTokenOwners=0;  //counter cache for the tokenOwners array 
    
    
    constructor(string memory _name, string memory _symbol) ERC20Token(_name){
        symbol=_symbol;
    }
    
    //overriding the parent mint() function
    function mint() public override{ 
        super.mint();
        tokenOwners.push(msg.sender);
        countTokenOwners+=1;
    }

}