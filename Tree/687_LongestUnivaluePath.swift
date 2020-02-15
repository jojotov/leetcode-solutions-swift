//
//  687_LongestUnivaluePath.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 ## 687. Longest Univalue Path
 ### Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.


 ```
 Input:
 
     5
    / \
   4   5
  / \   \
 1   1   5

 Output: 2
 ```
 
 ```
 Intput:
 
     1
    / \
   4   5
  / \   \
 4   4   5
 
 Output: 2
 ```
 */

class LongestUnivaluePath {
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return length(root, val: root.val).maxLen
    }
    
    func length(_ node: TreeNode?, val: Int) -> (len: Int, maxLen: Int) {
        guard let node = node else {
            return (0,0)
        }
        let left = length(node.left, val: node.val)
        let right = length(node.right, val: node.val)
        let maxLen = max(max(right.maxLen, left.len + right.len), max(left.maxLen, left.len + right.len))
        if node.val == val {
            return (max(left.len, right.len) + 1, maxLen)
        }
        return (0, maxLen)
    }
}
