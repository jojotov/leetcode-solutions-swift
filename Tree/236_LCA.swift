//
//  236_LCA.swift
//  LeetcodeSolutionSwift
//
//  Created by Tongzhou Ding on 2020/5/10.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]



  

 示例 1:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_236 {
    func findLCA(_ root: TreeNode?, _ n1: TreeNode?, _ n2: TreeNode?, lca: inout TreeNode?) -> Bool {
        guard let root = root else { return false }
        let isLeftTreeContainsNodes = findLCA(root.left, n1, n2, lca: &lca)
        let isRightTreeContainsNodes = findLCA(root.right, n1, n2, lca: &lca)
        if isLeftTreeContainsNodes && isRightTreeContainsNodes { lca = root } // 如果左右子树均包含，那么此根节点必定为 LCA
        if (isLeftTreeContainsNodes || isRightTreeContainsNodes) && ( n1?.val == root.val || n2?.val == root.val) { lca = root } //如果左右子树某一个包含，且根节点为某一个目标节点，那么根节点必定为 LCA

        return isLeftTreeContainsNodes || isRightTreeContainsNodes || n1?.val == root.val || n2?.val == root.val
    }

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var lca: TreeNode? = nil
        findLCA(root, p, q, lca: &lca)
        return lca
    }
}
