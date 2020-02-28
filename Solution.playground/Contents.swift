import UIKit
@testable import LeetcodeSolutionSwift


class ListNodeTest {
    static func sampleNode() -> ListNode {
        let node1 = ListNode(1), node2 = ListNode(2), node3 = ListNode(3), node4 = ListNode(4), node5 = ListNode(5), node6 = ListNode(6)
        let sample1 = node1
        sample1.next = node3
        sample1.next?.next = node4
        sample1.next?.next?.next = node5
        sample1.next?.next?.next?.next = node6
        return sample1
    }
    
    static func test() {
        testIntersectPoint()
        testReversedList()
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
    
    static func testReversedList() {
        let sample1 = sampleNode()
        sample1.print()
    }
}

//ListNodeTest.test()

let sample1: ListNode = ListNode(1)
sample1.push(5)
sample1.push(4)
sample1.push(3)
sample1.print()
sample1.length

//let reversed1: ListNode? = sample1.reversed()
//reversed1?.print()
//
//let splited = sample1.splitHalf()
//splited.0?.print()
//splited.1?.print()

var node1: ListNode? = ListNode(1)
node1?.push(3)
node1?.push(2)
var node2: ListNode? = ListNode(1)
node2?.push(3)
node2?.push(2)

ListNode.move(source: &node1, destination: &node2)
node1?.print()
node2?.print()

let shuffleMerged = ListNode.shuffleMerge(l1:node1,l2:node2)
shuffleMerged?.print()
let sortedMerged = ListNode.sortedMerge(l1:node1,l2:node2)
sortedMerged?.print()

