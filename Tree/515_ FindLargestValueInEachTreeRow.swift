//
//  515_ FindLargestValueInEachTreeRow.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 ## LeetCode 515. Find Largest Value in Each Tree Row
 
 You need to find the largest value in each row of a binary tree.

 Example:
 
 ```
 Input:

           1
          / \
         3   2
        / \   \
       5   3   9

 Output: [1, 3, 9]
 ```

 ### 思路
 
 1. 使用 BFS 广度优先算法遍历（https://medium.com/swift-algorithms-data-structures/understanding-depth-breadth-first-search-in-swift-90573fd63a36）
 2. 每层遍历时找出最大值

 */

class Solution_515 {
    static func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result: [Int] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var maxVal = Int.min
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                maxVal = max(maxVal, node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(maxVal)
        }

        return result
    }
}

