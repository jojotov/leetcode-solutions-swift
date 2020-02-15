//
//  665_NondecreasingArray.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 ### 665. Non-decreasing Array

 
 Given an array with `n` integers, your task is to check if it could become non-decreasing by modifying at most `1` element.
 
 We define an array is non-decreasing if `array[i] <= array[i + 1]` holds for every `i` (1 <= i < n).
 
 ```
 Example 1:
 Input: [4,2,3]
 Output: True
 Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
 ```
 
 ```
 Example 2:
 Input: [4,2,1]
 Output: False
 Explanation: You can't get a non-decreasing array by modify at most one element.
 ```
 
 Note: The `n` belongs to [1, 10,000].
 */

class Solution_665 {
    func checkPossibility(_ nums: [Int]) -> Bool {
        if nums.count > 10000 || nums.count == 0 {
            return false
        }
        
        if nums.count == 1 {
            return true
        }
        
        var nums = nums
        var modified = false
        for i in 0...nums.count - 2 {
            if !modified && nums[i] > nums[i+1] {
                let pre = (i != 0) ? nums[i-1] : 0
                if pre <= nums[i+1] {
                    nums[i] = pre
                    modified = true
                } else if nums[i] <= pre{
                    nums[i+1] = pre
                    modified = true
                } else {
                    nums[i+1] = nums[i]
                    modified = true
                }
            }
            
            if nums[i] > nums[i+1] {
                return false
            }
        }
        
        return true
    }
}
