// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//用 solidity 实现罗马数字转整数
contract Roman2Uint{
// 罗马数字转整数
    function roman2Uint(string memory roman) public pure returns(uint256) {
        bytes memory romanBytes = bytes(roman);
        uint256 result = 0;

        for (uint256 i = 0; i < romanBytes.length; i++) {
            uint256 currentValue = getRomanValue(romanBytes[i]);

            // 检查是否有下一个字符，并且当前值小于下一个值
            if (i + 1 < romanBytes.length) {
                uint256 nextValue = getRomanValue(romanBytes[i + 1]);
                if (currentValue < nextValue) {
                    // 如果当前值小于下一个值，则减去当前值
                    result += nextValue - currentValue;
                    i++; // 跳过下一个字符，因为它已经被处理
                } else {
                    // 否则加上当前值
                    result += currentValue;
                }
            } else {
                // 如果是最后一个字符，直接加上
                result += currentValue;
            }
        }

        return result;
    }

    // 获取罗马数字字符对应的值
    function getRomanValue(bytes1 char) private pure returns(uint256) {
        if (char == 'I') return 1;
        if (char == 'V') return 5;
        if (char == 'X') return 10;
        if (char == 'L') return 50;
        if (char == 'C') return 100;
        if (char == 'D') return 500;
        if (char == 'M') return 1000;
        revert("Invalid Roman numeral character");
    }
}
