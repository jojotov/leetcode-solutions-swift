//
//  101_SymmetricTree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/26.
//  Copyright © 2020 jojo. All rights reserved.
//

/*:
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
 1
 / \
 2   2
 \   \
 3    3
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/symmetric-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution_101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        var q1: [TreeNode?] = [root]
        var q2: [TreeNode?] = [root]
        
        while !q1.isEmpty {
            let n1 = q1.removeFirst()
            let n2 = q2.removeFirst()
            
            if n1 == nil && n2 == nil {
                continue
            }
             
            guard let node1 = n1, let node2 = n2 else {
                return false
            }
            
            if node1.val != node2.val {
                return false
            }

            q1.append(node1.left)
            q1.append(node1.right)
            // 反向插入
            q2.append(node2.right)
            q2.append(node2.left)
        }
        return true
    }
}
