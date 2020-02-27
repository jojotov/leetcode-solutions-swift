//
//  ListNode.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
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

// MARK: Equatable
extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}

// MARK: Reversed
extension ListNode {
    func reversed() -> ListNode {
        return self
    }
}

/*：
 Write a function to get the intersection point of two Linked Lists
 https://www.geeksforgeeks.org/write-a-function-to-get-the-intersection-point-of-two-linked-lists-set-2/

 Sample linked list:
 ```
 3 -> 6 -> 9 ->
                15 -> 30
          10 ->
 ```
 
 ## 思路：
 
 1. 判断链表是否相交：
 两个链表相交，意味着两个单链表必定再某处融合为一个单链表，因此两个链表会拥有同一个尾指针
 因此，只需要判断两个单链表的尾指针是否相同
 
 2. 找出交点：
 此处有两种思路：
    一种是通过记录两个链表长度 l1 和 l2，再通过两个工作指针相差 (l1 - l2) 步，最后交集的点就是交点。
    另一种是不需要记录长度：
    1. 定义两个指针 p1，p2 分别指向两个链表头
    2. 同时开始遍历链表
    3. 每个指针遍历完成后重新指向另一个链表头并继续遍历
    4. 当两个指针相遇时，此处为交点
 */
extension ListNode {
    public func isIntersect(with otherNode: ListNode?) -> Bool {
        guard let node = otherNode else {
            return false
        }
        
        var last1 = self, last2 = node
        while let next1 = last1.next {
            last1 = next1
        }
        while let next2 = last2.next {
            last2 = next2
        }
        return last1 == last2
    }
    
    public func intersectPoint(with otherNode: ListNode?) -> ListNode? {
        guard let node = otherNode else {
            return nil
        }
        var p1: ListNode? = self, p2: ListNode? = node
        while p1 != p2 {
            p1 = p1?.next
            p2 = p2?.next

            if p1 == nil {
                p1 = node
            }
            if p2 == nil {
                p2 = self
            }
        }
        return p1
    }
}

class ListNodeTest {
    static func test() {
        testIntersectPoint()
        print("List node test success!")
    }
    
    static func testIntersectPoint() {
        // 两个链表的交点
        let node1 = ListNode(1), node2 = ListNode(2), node3 = ListNode(3), node4 = ListNode(4), node5 = ListNode(5), node6 = ListNode(6)
        let sample1 = node1
        sample1.next = node3
        sample1.next?.next = node4
        sample1.next?.next?.next = node5
        sample1.next?.next?.next?.next = node6

        let sample2 = node2
        sample2.next = node4

        let sample3 = ListNode(8)
        sample3.next = ListNode(9)

        assert(sample1.isIntersect(with: sample2))
        assert(sample1.intersectPoint(with: sample2) == node4)
        assert(!sample1.isIntersect(with: sample3))

    }
    
}
