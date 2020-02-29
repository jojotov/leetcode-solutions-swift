//
//  103_ZigZagLevelOrder.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/20.
//  Copyright © 2020 jojo. All rights reserved.
//

/*:
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回锯齿形层次遍历如下：

 [
   [3],
   [20,9],
   [15,7]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution_103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var depth = 0;
        var queue: [[TreeNode]] = [[root]]
        var result: [[Int]] = []
        
        while !queue.isEmpty {
            let levelQueue = queue.removeFirst()
            var levelResult: [Int] = []
            var nexLevelQueue: [TreeNode] = []
            
            var tempQueue = levelQueue
            if depth % 2 == 0 {
                tempQueue = levelQueue.reversed()
            }
            
            for node in tempQueue {
                levelResult.append(node.val)
                if let left = node.left {
                    nexLevelQueue.append(left)
                }
                if let right = node.right {
                    nexLevelQueue.append(right)
                }
            }
            if !nexLevelQueue.isEmpty {
                queue.append(nexLevelQueue)
            }
            if !levelResult.isEmpty {
                result.append(levelResult)
            }
            depth = depth + 1;
        }
        
        return result
    }
}
