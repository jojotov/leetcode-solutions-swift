//
//  ListNode.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public func print() {
        var p: ListNode? = self
        while (p != nil) {
            Swift.print(" \(p!.val) -> ")
            p = p?.next
        }
    }
}
