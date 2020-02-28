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
}

// MARK: Print
extension ListNode {
    public func print() {
        var p: ListNode? = self
        var info: String = ""
        while (p != nil) {
            info.append("\(p!.val) -> ")
            p = p?.next
        }
        info.append("NULL")
        Swift.print(info)
    }
}

// MARK: Push
extension ListNode {
    /// Push a specified value next to current node
    /// - Parameter val: the value ready to push
    public func push(_ val: Int) {
        let node = ListNode(val)
        if self.next == nil {
            self.next = node
            return
        }
        let temp = self.next
        self.next = node
        node.next = temp
    }
}

// MARK: Length
extension ListNode {
    public var length: Int {
        get {
            var len = 0, node: ListNode? = self
            while node != nil {
                len += 1
                node = node?.next
            }
            return len
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
    public func reversed() -> ListNode? {
        return Self.recursiveReversed(self)
    }
    
    static func reversed(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var result: ListNode?, curr: ListNode?
        curr = head
        while curr != nil {
            let temp = curr?.next
            curr?.next = result
            result = curr
            curr = temp
        }
        
        return result
    }
    
    static func recursiveReversed(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let first = head
        var rest = first.next
        
        if rest == nil {
            return first
        }
        
        rest = recursiveReversed(rest)
        first.next?.next = first // 1->2<-3<-4 to  1<-2<-3<-4
        first.next = nil
        
        return rest
    }
}

// MARK: Move
extension ListNode {
    public static func move(source: inout ListNode?, to destination: inout ListNode?) {
        guard let node = source else {
            return
        }
        source = node.next
        node.next = destination
        destination = node
    }
}

// MARK: Split
extension ListNode {
    public func splitHalf() -> (ListNode?, ListNode?) {
        var fast: ListNode? = self, slow: ListNode? = self
        if self.next == nil { return (nil,nil) }
        while fast != nil {
            fast = fast?.next // 1. advance fast first
            if fast?.next != nil { // 2. advance fast and slow if fast is not at end
                fast = fast?.next
                slow = slow?.next
            }
        }
        let front = self, back = slow?.next
        slow?.next = nil // 3. cut the list
        return (front,back)
    }
}

// MARK: Merge
extension ListNode {
    // l1: (1->2->3), l2: (4->5->6)
    // shuffle merged: (1->4->2->5->3->6)
    public static func shuffleMerge(l1: ListNode?, l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        let dummy:ListNode? = ListNode(-1)
        var head = dummy
        var p1 = l1, p2 = l2
        while true {
            if p1 == nil {
                head?.next = p2
                break
            } else if p2 == nil {
                head?.next = p1
                break
            } else {
                head?.next = p1
                head = p1
                p1 = p1?.next
                head?.next = p2
                head = p2
                p2 = p2?.next
            }
        }
        return dummy?.next
    }
    
    public static func sortedMerge(l1: ListNode?, l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        let dummy: ListNode? = ListNode(-1)
        var head: ListNode? = dummy
        var p1 = l1, p2 = l2
        while true {
            if p1 == nil {
                head?.next = p2
                break
            } else if p2 == nil {
                head?.next = p1
                break
            } else {
                if p1!.val <= p2!.val {
                    head?.next = p1
                    p1 = p1?.next
                } else {
                    head?.next = p2
                    p2 = p2?.next
                }
                head = head?.next
            }
        }
        return dummy?.next
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
