//
//  209_minSubArray.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/3.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 209. 长度最小的子数组
 
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。

 示例:

 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 进阶:

 如果你已经完成了O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。

*/

public class Solution_209 {
    public static func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 && nums.first! >= s {
            return 1
        }
        
        var left = 0, right = 0, result = 0, val = 0
        while right < nums.count {
            print("left: \(left), right: \(right), res: \(result)")
            
//            if right >= nums.count {
//                return result
//            }
//
            if left >= 0 && val >= s {
                result = min(result, right - left)
                left = left + 1
                val -= nums[left]
            } else {
                right = right + 1
                val += nums[right]
                right = right + 1
            }
        }
        return result
    }
}
