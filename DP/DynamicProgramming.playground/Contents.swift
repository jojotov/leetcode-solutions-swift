//: Playground - noun: a place where people can play

import UIKit

/*:
 ## 198. House Robber

 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and **it will automatically contact the police if two adjacent houses were broken into on the same night.**
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight **without alerting the police.**
 
 Example:
 
 ```
 | House1 (150) | House 2 (50) | House 3 (450) | House 4 (30) | House 5 (20) |
 ```
 
 **不能同时抢劫相邻的房子！**

 思路：
 1. 首先进行排序
 2. 从第 n 个开始（n 初始为0）
 3. 开始抢房子（此区间内金额最大）
 4. 再抢劫剩余房子最大金额，且不相邻的
 5. 最后得出总金额，与之前相比较保留最大值
 6. n 加 1，继续上述步骤
 
 */

class Solution_HouseRobber {
    func rob(_ nums: [Int]) -> Int {
        // 1,2,3
        var result = 0
        var n = 0
        let houses: [(amount: Int, index: Int)] = nums
            .map {
                return ($0, (nums.index(of: $0)?.distance(to: 0))!)
        }
            .sorted {
                return $0.0 > $1.0
        }
        
        while n <= nums.count {
            var robbed: [(amount: Int, index: Int)] = []
            
            // 3
            for i in 0..<houses.count {
                let house = houses[i]
                if robbed.contains(where: { abs($0.index - house.index) <= 1 }) == false {
                    robbed.append(house)
                }
            }
            
            // 5
            let sum = robbed.reduce(0, { (x, y) -> Int in
                x + y.0
            })
            result = max(sum, result)
            
            // 6
            n += 1
        }
        
        return result
    }
}

Solution_HouseRobber().rob([150,20,60,15,80])
