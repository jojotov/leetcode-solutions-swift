//
//  169_MajorityElement.swift
//  
//  Copyright © 2020 jojo. All rights reserved.
// 
//  Author: jojo
//  Created at: 2020/3/16
//
//  If you have any problems, please contact me:
//  MAIL:   tongzhou_ding@sui.com
//  QQ:     385317445
//  PHONE:  15622184961
//

import Foundation
/*:
 169. 多数元素
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:

 输入: [3,2,3]
 输出: 3
 示例 2:

 输入: [2,2,1,1,1,2,2]
 输出: 2
 */
class Solution {
    func count(_ nums: [Int], element: Int) -> Int {
        return nums.reduce(0) { (res, num) -> Int in
            if num == element { return res + 1 }
            return res
        }
    }
    
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums.first! }
        
        let mid = nums.count / 2
        let left: [Int] = Array(nums[0..<mid]), right: [Int] = Array(nums[mid..<nums.count])
        
        // 1. 求出左子串和右子串的多数元素
        let leftMaj = majorityElement(left)
        let rightMaj = majorityElement(right)

        // 2. 如果两个多数元素相等，那么直接返回
        // 因为左边的多数元素必定大于左边的一半，右边同理，那么加起来一定大于整个数组的一半
        if leftMaj == rightMaj { return leftMaj }
        
        // 3. 如果不等，判断哪个元素在整个数组中出现的次数较多
        return count(nums, element: leftMaj) > count(nums, element: rightMaj) ? leftMaj : rightMaj
    }
}
