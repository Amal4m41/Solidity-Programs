pragma solidity>=0.5.1;   //declare the version

contract DataTypesSolidity{
    // enum State {Waiting, Read ,Active} //0,1,2
    
    // State public stateValue;  //accessing value using stateValue() will give us 0 for Waiting,
    // //1 for Read etc.
    
    // constructor(){
    //     stateValue=State.Waiting;
    // }
    
    // function setActive() public{
    //     stateValue=State.Active;
    // }
    
    // function isActive() view public returns(bool){
    //     return stateValue==State.Active;
    // }
    
    uint public personCount=0;
    
    struct Person{  //creaing a dataype of Person
        string firstName;
        string lastName;
        uint8 age;
    }
    
    //Using list:
    // Person[] public people;  //creating an array to store datatype of Person.
    
    //Using mapping:
    mapping(uint => Person) public people;
    
    function addPerson(string memory _firstName,string memory _lastName, uint8 _age) public{
        personCount+=1;
        // people.push(Person(_firstName,_lastName,_age));
        people[personCount]=Person(_firstName,_lastName,_age); //key starting from 1
    }
    
    
}