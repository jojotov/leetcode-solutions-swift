//
//  104_MaxDeethOfBinaryTree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree

 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
 ```
    3
   / \
  9  20
    /  \
   15   7
 ```
 返回它的最大深度 3 。
*/

class Solution_104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0;
        }
        
        if root.left == nil && root.right == nil {
            return 1; // leaf
        }
        
        return max(1+maxDepth(root.left), 1+maxDepth(root.right))
    }
}
