//
//  Massager.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/31.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 一个有名的按摩师会收到源源不断的预约请求，每个预约都可以选择接或不接。在每次预约服务之间要有休息时间，因此她不能接受相邻的预约。给定一个预约请求序列，替按摩师找到最优的预约集合（总预约时间最长），返回总的分钟数。

 注意：本题相对原题稍作改动
  

 示例 1：

 输入： [1,2,3,1]
 输出： 4
 解释： 选择 1 号预约和 3 号预约，总时长 = 1 + 3 = 4。
 示例 2：

 输入： [2,7,9,3,1]
 输出： 12
 解释： 选择 1 号预约、 3 号预约和 5 号预约，总时长 = 2 + 9 + 1 = 12。
 示例 3：

 输入： [2,1,4,5,3,1,1,3]
 输出： 12
 解释： 选择 1 号预约、 3 号预约、 5 号预约和 8 号预约，总时长 = 2 + 4 + 3 + 3 = 12
 */
public class Solution_Massager {
    /*
     对例如 [2,7,9,3,1] 构建 dp table：
    j\i  2    7    9    3    1
     2   2    2   11    5   12      // 对于每一个元素 dp[i][j], 代表第一次选 j 的情况下，当前 i 的最大可能
                                    // dp[i][j] = dp[i-2][j] + arr[i]
     7   0    7    7    10  11      // 最后的结果是 max(dp[i][j], dp[i][j-1]

     */
    static public func massage(_ nums: [Int]) -> Int {
        var result = 0
        var dp: [[Int]] = [Array(repeating: 0, count: nums.count), Array(repeating: 0, count: nums.count)]
        // 构造 dp
        for i in 0..<nums.count {
            if i > 2 {
                dp[0][i] = max(dp[0][i-2] + nums[i], dp[0][i-3] + nums[i])
                dp[1][i] = max(dp[1][i-2] + nums[i], dp[1][i-3] + nums[i])
            } else if i == 2 {
                dp[0][i] = dp[0][i-2] + nums[i]
                dp[1][i] = dp[1][i-2] + nums[i]
            } else {
                dp[0][i] = nums[i]
                dp[1][i] = i == 1 ? nums[i] : 0
            }
            result = max(result, max(dp[0][i], dp[1][i]))
        }
        
        return result
    }
}
