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
        var large: ListNode?
        var small: ListNode?
        
        while p != nil {
            if small != nil && large != nil {
                break
            }
            if p!.val <= x {
                small = p
            } else {
                large = p
            }
            p = p?.next
        }
        
        let dummy = ListNode(-1)
        dummy.next = small
        p = head
        
        while p != nil {
            if p!.val <= x {
                dummy.next = p
            }
        }
        return dummy.next
    }
}
