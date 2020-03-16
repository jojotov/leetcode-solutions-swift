//
//  21_MergeLists.swift
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
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution_21 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        let dummy = ListNode(-1)
        var head: ListNode? = dummy
        var p1 = l1, p2 = l2
        while p1 != nil && p2 != nil {
            // 判断当前指针大小
            if p1!.val <= p2!.val {
                head?.next = p1
                p1 = p1?.next
            }
            else {
                head?.next = p2
                p2 = p2?.next
            }
            
            head = head?.next
        }
        
        // 判断链表 1 是否已经走完，是的话直接接上链表 2，否则接上链表 1
        head?.next = p1 == nil ? p2 : p1
        
        return dummy.next
    }
    
    // 递归
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else  {
            return l2
        }
        guard let l2 = l2 else  {
            return l1
        }
        
        if l1.val <= l2.val {
            l1.next = mergeTwoLists2(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists2(l1, l2.next)
            return l2
        }
    }
}
