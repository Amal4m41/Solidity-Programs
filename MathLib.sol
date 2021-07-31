pragma solidity>=0.5.0;   //declare the version

library Math{
    //library belongs inside of a smart contract so that it can be used
    // They don't have storage of themselves
    //We can't inherit from a library, it's not a smart contract.
    
    function divide(uint256 a, uint256 b)  internal pure returns(uint256){
        require(b>0); //if b >0 then continue otherwise, keep throw an error.
        uint256 c = a/b;
        return c;
    }
    
}