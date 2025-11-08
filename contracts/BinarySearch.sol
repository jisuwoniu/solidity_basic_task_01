// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//在一个有序数组中查找目标值。
contract BinarySearch{

    // 二分查找（返回索引，未找到返回 -1）
    function search(int256[] memory sortedArray, int256 target)
        public pure returns (int256)
    {
        int256 left = 0;
        int256 right = int256(sortedArray.length) - 1;

        while (left <= right) {
            int256 mid = left + (right - left) / 2;

            if (sortedArray[uint256(mid)] == target) {
                return mid;  // 找到目标
            } else if (sortedArray[uint256(mid)] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return -1;  // 未找到
    }
}