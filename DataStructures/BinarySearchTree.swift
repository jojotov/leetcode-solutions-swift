//
//  BinarySearchTree.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 # Binary Search Tree

 ## 内容
 - BST 构建
 - BST 基本操作（插入、删除、搜索、遍历）
 
 ## Sample tree
 
 ```
       7
     /   \
    2    10
   / \   /
  1   5 9
 ```
 
 ## 基本特点
 - 每个**左子节点**都比其父节点**小**
 - 每个**右子节点**都比其父节点**大**
 */


indirect enum BSTree<E: Comparable> {
    case empty
    case leaf(E)
    case node(BSTree<E>, E, BSTree<E>)
}


extension BSTree: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self {
    case .empty: return "."
    case .leaf(let value): return "\(value)"
    case .node(let left, let value, let right):
      return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
    }
  }
}

/*:
 ## 插入
 
 1. 将待插入的值与根节点值比较
 2. 如果待插入的值较大，那么取右子树，否则取左子树
 3. 重复 1 和 2 直到找到空子树
 4. 插入值
 */

extension BSTree {
    func insert(_ value: E) -> BSTree<E> {
        switch self {
        case .empty:
            return .leaf(value)
        case .leaf(let e):
            if (e > value) {
                return .node(.leaf(value), e, .empty)
            } else {
                return .node(.empty, e, .leaf(value))
            }
        case .node(let left, let e, let right):
            if (e > value) {
                return .node(left.insert(value), e, right)
            } else {
                return .node(left, e, right.insert(value))
            }
        }
    }
}

/*:
 ## 查询
 
 1. 将待插入的值与根节点值比较
 2. 如果待插入的值较大，那么取右子树，否则取左子树
 3. 重复 1 和 2 直到找到相同的值
 */

extension BSTree {
    func search(_ value: E) -> BSTree<E>? {
        switch self {
        case .empty:
            return nil
        case .leaf(let e):
            if e == value {
                return self
            }
            return nil
        case .node(let left, let e, let right):
            if e > value {
                return left.search(value)
            } else if e == value {
                return self
            } else {
                return right.search(value)
            }
        }
    }
}


