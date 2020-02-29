//
//  102_LevelOrderFromBottom.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其自底向上的层次遍历为：

 [
   [15,7],
   [9,20],
   [3]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_107 {
    func levelOrder(with level: [TreeNode]) -> ([Int]?, [TreeNode]?)?{
        if level.isEmpty {
            return nil
        }
        var levelResult: [Int] = []
        var nexLevelQueue: [TreeNode] = []
        for node in level {
            levelResult.append(node.val)
            if let left = node.left {
                nexLevelQueue.append(left)
            }
            if let right = node.right {
                nexLevelQueue.append(right)
            }
        }
        return (levelResult.isEmpty ? nil : levelResult,
                nexLevelQueue.isEmpty ? nil : nexLevelQueue)
    }
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var queue: [[TreeNode]] = [[root]]
        var result: [[Int]] = []
        
        while !queue.isEmpty {
            let level = queue.removeFirst()
            if let levelOrder = levelOrder(with: level) {
                if let levelResult = levelOrder.0 {
                    result.append(levelResult)
                }
                if let nextLevelQueue = levelOrder.1 {
                    queue.append(nextLevelQueue)
                }
            }
        }

        return result.reversed()
    }
}
