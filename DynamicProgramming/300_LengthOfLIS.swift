//
//  300_LengthOfLIS.swift
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
 300. 最长上升子序列
 
 给定一个无序的整数数组，找到其中最长上升子序列的长度。

 示例:
 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。

 说明:
 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n2) 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class Solution_300 {
    public static func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var dp: [Int:Int] = [:] // index-lis
        var result = 1
        for i in 0..<nums.count { // 'i' representing current index
            dp[i] = 1 // initial value
            for j in 0..<i { // 'j' representing prev-array scanning
                if nums[i] > nums[j] { // '>' representing 'increasing', as '>=' representing 'non-decreasing'.
                    // current value is greater than prev-scanning value,
                    // so it can consider as an element of LIS
                    dp[i] = max(dp[j]! + 1, dp[i]!)
                }
                result = max(result, dp[i]!)
            }
        }
        
        return result
    }
}
