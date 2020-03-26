//
//  70_ClimbStairs.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/23.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 70. 爬楼梯

 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 注意：给定 n 是一个正整数。

 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶

 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶

 */
public class Solution_70 {
    static public func climbStairs(_ n: Int) -> Int {
        var memo: [Int:Int] = [0:1,1:1]
        return helper(n,&memo)
    }
    
    static func helper(_ n: Int, _ memo: inout [Int:Int]) -> Int {
        if let memorized = memo[n] { return memorized }
        memo[n-1] = helper(n-1, &memo)
        memo[n-2] = helper(n-2, &memo)
        return memo[n-1]! + memo[n-2]!
    }
}
