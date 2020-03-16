//
//  CuttingRope.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/16.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 343. 整数拆分
 
 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。

 示例 1:

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1。
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
 说明: 你可以假设 n 不小于 2 且不大于 58。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/integer-break
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
public class Solution_343 {

    
    static public func integerBreak1(_ n: Int) -> Int {
        if n <= 1 { return 0 }
        if n == 2 { return 1 }
        if n == 3 { return 2 }
        
        var bottom_up: [Int] = Array(repeating: 0, count: n+1)
        bottom_up[0] = 0
        bottom_up[1] = 1
        bottom_up[2] = 2
        bottom_up[3] = 3
        
        var maxValue = 0
        for i in 4...n {
            maxValue = 0
            for j in 1...i/2 {
                maxValue = max(maxValue, bottom_up[j] * bottom_up[i-j])
                bottom_up[i] = maxValue
            }
        }
        
        return bottom_up[n]
    }
}
