//
//  34_SearchRange.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/3.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 你的算法时间复杂度必须是 O(log n) 级别。

 如果数组中不存在目标值，返回 [-1, -1]。

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // 1. 有序
        // 2. 目标值
        // 因此考虑二分查找，
        // 在二分查找中，命中目标值后，继续往左边找，即右指针左移，可以找到 index 最小值，反之找最大
        return [searchForLowerIndex(nums, target), searchForHigherIndex(nums, target)]
    }
    
    func searchForLowerIndex(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count, mid = 0, result = -1
        while left < right {
            mid = left + (right - left) / 2 // not overflowing
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            } else {
                right = mid // 右指针往左找最小
                result = mid
            }
        }
        return result
    }
    
    func searchForHigherIndex(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count, mid = 0, result = -1
        while left < right {
            mid = left + (right - left) / 2 // not overflowing
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            } else {
                left = mid + 1 // 左指针往右找最大
                result = mid
            }
        }
        return result
    }

}
