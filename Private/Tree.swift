//
//  Tree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    static var testRoot: TreeNode {
        let leaf4 = TreeNode(4)
        let leaf5 = TreeNode(5)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let root = TreeNode(1)
        node4.left = leaf4
        node4.right = leaf4
        node5.right = leaf5
        root.left = node4
        root.right = node5
        return root
    }
}

// MARK: BinaryTree in enum
indirect enum BinaryTree<E: Comparable> {
    case empty
    case node(BinaryTree<E>, E, BinaryTree<E>)
    
    init() {
        self = .empty
    }
    
    init(_ element: E, left: BinaryTree<E>, right: BinaryTree<E>) {
        self = .node(left, element, right)
    }
}


// MARK: 前序遍历 (Pre-order Traversing)
// 先访问根节点，再访问左子节点，最后访问右子节点
extension BinaryTree {
    func traversePreOrder() -> [E] {
        switch self {
        case .empty:
            return []
        case .node(let left, let element, let right):
            return [element] + left.traversePreOrder() + right.traversePreOrder()
        }
    }
}

// MARK: 中序遍历 (In-order Traversing)
// 先访问左子节点，再访问根节点，最后访问右子节点
extension BinaryTree {
    func traverseInOrder() -> [E] {
        switch self {
        case .empty:
            return []
        case .node(let left, let element, let right):
            return left.traverseInOrder() + [element] + right.traverseInOrder()
        }
    }
}


// MARK: 后序遍历 (Post-order Traversing)
// 先访问左子节点，再访问右子节点，最后访问根节点
extension BinaryTree {
    func traversePostOrder() -> [E] {
        switch self {
        case .empty:
            return []
        case .node(let left, let element, let right):
            return left.traversePostOrder() + right.traversePostOrder() + [element]
        }
    }
}


// MARK: BFS
/*：
 ## BFS
 使用一个 FIFO 的队列，首先把根节点压入队列
 然后在队列不为空的循环中：
 1. 从队列中吐出一个节点
 2. 遍历队列，对每个节点进行：
    1. 输出节点值
    2. 如果有左节点，那么压入左节点
    3. 如果有右节点，那么压入右节点
 */

extension BinaryTree {
    func isEmpty() -> Bool {
        switch self {
        case .empty:
            return true
        default:
            return false
        }
    }
    
    func BFS() -> [E] {
        var queue: [BinaryTree] = []
        var result: [E] = []
        queue.append(self)
        
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                switch node {
                case .empty:
                    continue;
                case .node(let left, let e, let right):
                    if !left.isEmpty() {
                        queue.append(left)
                    }
                    if !right.isEmpty() {
                        queue.append(right)
                    }
                    result.append(e)
                }
            }
        }
        
        return result
    }
}
