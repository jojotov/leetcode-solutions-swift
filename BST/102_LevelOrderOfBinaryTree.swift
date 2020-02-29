//
//  102_LevelOrderOfBinaryTree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
 ```
     3
    / \
   9  20
     /  \
    15   7
 ```

 返回其层次遍历结果：
 ```
 [
   [3],
   [9,20],
   [15,7]
 ]
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var queue: [[TreeNode]] = [[root]]
        var result: [[Int]] = []
        
        while !queue.isEmpty {
            let levelQueue = queue.removeFirst()
            var levelResult: [Int] = []
            var nextLevelQueue: [TreeNode] = []
            if levelQueue.isEmpty {
                continue
            }
            for node in levelQueue {
                levelResult.append(node.val)
                if let left = node.left {
                    nextLevelQueue.append(left)
                }
                if let right = node.right {
                    nextLevelQueue.append(right)
                }
            }
            if !nextLevelQueue.isEmpty {
                queue.append(nextLevelQueue)
            }
            if !levelResult.isEmpty {
                result.append(levelResult)
            }
        }
        
        return result
    }
}
