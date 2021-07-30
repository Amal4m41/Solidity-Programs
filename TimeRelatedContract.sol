pragma solidity>=0.5.1;   //declare the version

contract TimeRelatedContract{

    uint public personCount=0;
    uint256 public openingTime=block.timestamp+20; //will be used to represent seconds, as timestamp values are stored in seconds in solidity.
    //block.timestamp gives the current time in seconds w.r.t epoch and we add 20 seconds to it, therefore if we try to access the function
    //before 20 seconds from deployment of this contract it'll return error otherwise it'll allow.
    
    // uint256 public transactionTime;
    
    struct Person{  //creaing a dataype of Person
        string firstName;
        string lastName;
        uint8 age;
    }
    
    //Using mapping:
    mapping(uint => Person) public people;
    
    modifier onlyWhileOpen{  
        require(block.timestamp > openingTime);  //if the time as been passed then allow the function call, otherwise return error.
        _;  //to execute the code of the function that uses this modifier(i.e. addPerson(..))
    }
    
    function returnCurrentTime() public view returns(uint256){  //just to check the current time.
        return block.timestamp;
    }

    
    function addPerson(string memory _firstName,string memory _lastName, uint8 _age) public onlyWhileOpen{
        incrementCount();
        people[personCount]=Person(_firstName,_lastName,_age); //key starting from 1
    }
    
    function incrementCount() internal{   //internal method can be only called(is visible) within this contract.
        personCount+=1;
    }
}