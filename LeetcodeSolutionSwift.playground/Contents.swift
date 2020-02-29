import UIKit
import LeetcodeSolutionSwift

var str = "Hello, playground"

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

ListNode.move(source: &node1, to: &node2)
node1?.print()
node2?.print()

let shuffleMerged = ListNode.shuffleMerge(l1:node1,l2:node2)
shuffleMerged?.print()
let sortedMerged = ListNode.sortedMerge(l1:node1, l2:node2)
sortedMerged?.print()

