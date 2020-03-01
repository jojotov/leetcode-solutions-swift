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

public class DoubleList<T: Equatable> {
    private var head: DoubleListNode<T>?
    
    public init(_ val: T) {
        self.head = DoubleListNode(val)
    }
    
    public func add(_ val: T) {
        self.add(DoubleListNode(val))
    }
    
    public func add(_ node: DoubleListNode<T>?) {
        guard let head = self.head else {
            self.head = node
            return
        }
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
        guard let head = self.head else {
            self.head = node
            return
        }
        head.next = node
        node?.prev = head
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
        guard let head = self.head else { return nil }
        var p = head
        while p.next != nil {
            p = p.next!
        }
        self.remove(p)
        return p
    }
    
    public func size() -> Int {
        guard let head = self.head else { return 0 }
        var p = head, count = 1
        while p.next != nil {
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
