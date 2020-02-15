//
//  111_MinDepthOfBinaryTree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/

 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
 ```
    3
   / \
  9  20
    /  \
   15   7
 ```
 返回它的最小深度 2 。
*/

class Solution_111 {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0;
        }
   
        if root.left == nil && root.right == nil {
            return 1; // leaf
        }
        
        let minDepthLeft = minDepth(root.left)
        let minDepthRight = minDepth(root.right)
        
        if root.left == nil || root.right == nil {
            return minDepthLeft == 0 ? minDepthRight : minDepthLeft
        }
        return min(minDepthLeft,minDepthRight) + 1
    }
}
