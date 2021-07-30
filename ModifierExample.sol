pragma solidity>=0.5.1;   //declare the version

contract DataTypesSolidity{

    uint public personCount=0;
    address public ownerAddress; //address is a builtin datatype to store blockchain address;
    
    struct Person{  //creaing a dataype of Person
        string firstName;
        string lastName;
        uint8 age;
    }
    
    //Using mapping:
    mapping(uint => Person) public people;
    
    //custom modifier
    modifier onlyOwner{  //this modifier will check if any function using this modifier is called using the 
    //address of the owner, if true then execute the function otherwise return error so that the transaction 
    //will be reverted and no gas fee will be taken.
    
        require(msg.sender==ownerAddress); // will throw error if the statement is not true
        _;  //to execute the code of the function that uses this modifier(i.e. addPerson(..))
        
    }
    
    constructor(){
        ownerAddress=msg.sender; // initialize with the address of the deployer of this contract. 
    }
    
    function addPerson(string memory _firstName,string memory _lastName, uint8 _age) public onlyOwner{
        incrementCount();
        people[personCount]=Person(_firstName,_lastName,_age); //key starting from 1
    }
    
    function incrementCount() internal{   //internal method can be only called within this contract.
        personCount+=1;
    }
}