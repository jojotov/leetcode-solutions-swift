//
//  DoubleListNode.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/1.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class DoubleListNode<T: Equatable> {
    public var val: T?
    public var next: DoubleListNode<T>?
    public var prev: DoubleListNode<T>?
    public init() {
        self.val = nil
        self.next = nil
    }
    public init(_ val: T) {
        self.val = val
        self.next = nil
    }
}

extension DoubleListNode: Equatable {
    public static func == (lhs: DoubleListNode<T>, rhs: DoubleListNode<T>) -> Bool {
        return lhs.val == rhs.val
    }
}

extension DoubleListNode {
    public static func Empty() -> DoubleListNode {
        return DoubleListNode()
    }
}

public class DoubleList<T: Equatable> {
    public var head: DoubleListNode<T> = DoubleListNode.Empty()
    public var tail: DoubleListNode<T> {
        var temp = head
        while temp.next != nil && temp.next != head {
            temp = temp.next!
        }
        return temp
    }
    
    public init(_ val: T) {
        self.append(DoubleListNode(val))
    }
    
    public func add(_ val: T) {
        self.add(DoubleListNode(val))
    }
    
    public func add(_ node: DoubleListNode<T>?) {
        let next = head.next
        head.next = node
        node?.prev = head
        node?.next = next
        next?.prev = node
    }

    public func append(_ val: T) {
        self.append(DoubleListNode(val))
    }
    
    public func append(_ node: DoubleListNode<T>?) {
        let tail = self.tail
        node?.next = tail.next
        tail.next = node
        node?.prev = tail
    }
    
    public func remove(_  node: DoubleListNode<T>?) {
        guard let node = node else { return }
        let prev = node.prev
        let next = node.next
        if prev != nil {
            prev?.next = next
        }
        if next != nil {
            next?.prev = prev
        }
        
        node.next = nil
        node.prev = nil
    }
    
    public func removeLast() -> DoubleListNode<T>? {
        let tail = self.tail
        if tail == head { return nil }
        self.remove(tail)
        return tail
    }
    
    public func size() -> Int {
        var p = head, count = 0
        let tail = self.tail
        while p.next != nil && p.next != tail {
            p = p.next!
            count += 1
        }
        return count
    }
}

extension DoubleList {
    public func print() {
        var p: DoubleListNode? = self.head
        var info: String = "Current size: \(self.size()) | "
        while (p != nil) {
            if let val = p?.val {
                info.append("\(String(describing: val)) -> ")
            }
            p = p?.next
        }
        info.append("NULL")
        Swift.print(info)
    }
}
