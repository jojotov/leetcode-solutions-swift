//
//  86_Partition.swift
//  
//  Copyright © 2020 jojo. All rights reserved.
// 
//  Author: jojo
//  Created at: 2020/2/28
//
//  If you have any problems, please contact me:
//  MAIL:   tongzhou_ding@sui.com
//  QQ:     385317445
//  PHONE:  15622184961
//

/*:
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution_86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil { return nil }
        var p: ListNode? = head
        let dummySmall = ListNode(-1), dummyLarge = ListNode(-1)
        var small: ListNode? = dummySmall, large: ListNode? = dummyLarge

        while p != nil {
            if p!.val < x {
                // move p to small
                let temp = p
                p = temp?.next
                temp?.next = nil
                small?.next = temp
                small = small?.next
            } else {
                // move p to large
                let temp = p
                p = temp?.next
                temp?.next = nil
                large?.next = temp
                large = large?.next
            }
        }
        small?.next = dummyLarge.next
        return dummySmall.next
    }
}
