// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//反转字符串 (Reverse String)
//题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
 

contract ReverseString{

    function reverseString(string memory input) public pure returns (string memory) {
        bytes memory inputBytes = bytes(input);
        
        uint256  inputLength = inputBytes.length;
        bytes memory reversBytes= new bytes(inputLength);
        
        for(uint256 i = 0; i < inputLength; i++){

            reversBytes[i]=inputBytes[inputLength-1-i];
        }
        return string(reversBytes);
    }


}