//
//  2_AddTwoNumbers.swift
//  
//  Copyright © 2020 jojo. All rights reserved.
// 
//  Author: jojo
//  Created at: 2020/2/27
//
//  If you have any problems, please contact me:
//  MAIL:   tongzhou_ding@sui.com
//  QQ:     385317445
//  PHONE:  15622184961
//

/*:
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

import Foundation

class Solution_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var added = 0
        let result = ListNode(0)
        var head: ListNode? = result
        var p1 = l1, p2 = l2
        while p1 != nil || p2 != nil {
            var val = 0
            if p1 == nil {
                val = added + p2!.val
            } else if p2 == nil {
                val = added + p1!.val
            } else {
                val = p1!.val + p2!.val + added
            }
            
            let tempVal = val % 10
            added = val / 10
            head?.next = ListNode(tempVal)
            head = head?.next
            p1 = p1?.next
            p2 = p2?.next
        }
        
        // added in last
        if added > 0 {
            head?.next = ListNode(added)
        }
        return result.next
    }
}
