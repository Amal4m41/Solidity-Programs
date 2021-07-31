pragma solidity>=0.5.0;   //declare the version

import "./SafeMath.sol";

// import "./MathLib.sol";
//OR
// library Math{
//     //library belongs inside of a smart contract so that it can be used
//     // They don't have storage of themselves
//     //We can't inherit from a library, it's not a smart contract.
    
//     function divide(uint256 a, uint256 b)  internal pure returns(uint256){
//         require(b>0); //if b >0 then continue otherwise, keep throw an error.
//         uint256 c = a/b;
//         return c;
//     }
    
// }
contract MyContract{
    using SafeMath for uint256;  //method-2
    uint256 public value;
    
    function calculate(uint256 _value1, uint256 _value2) public {
        // value=SafeMath.div(_value1,_value2); method-1
        value=_value1.div(_value2);
    }
}