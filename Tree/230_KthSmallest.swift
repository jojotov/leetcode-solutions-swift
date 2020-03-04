//
//  230_KthSmallest.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/3.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 230. 二叉搜索树中第K小的元素
 给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。

 说明：
 你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 1
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 3


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_230 {
    func inOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        return inOrder(root.left) + [root.val] + inOrder(root.right)
    }
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else { return 0 }
        let inOrderResult = inOrder(root)
        return inOrderResult[k-1]
    }
}
