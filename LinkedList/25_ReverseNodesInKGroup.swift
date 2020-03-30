//
//  25_ReverseNodesInKGroup.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*: 25. Reverse Nodes in k-Group

 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 You may not alter the values in the nodes, only nodes itself may be changed.
 
 Only constant memory is allowed.
 
 For example,
 Given this linked list: `1->2->3->4->5`
 
 For k = 2, you should return: `2->1->4->3->5`
 
 For k = 3, you should return: `3->2->1->4->5`
 */


class Solution_25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head?.next == nil || k <= 1{
            return head
        }
        
        // 临时指针保持链表头
        let dummy = ListNode(-1)
        dummy.next = head
        var start: ListNode? = dummy
        
        // 循环翻转
        while true {
            // prev 指针指向当前区间的尾指针
            let prev = start
            var fast: ListNode? = prev, curr: ListNode? = prev
            
            // start需要移动到下一区间开始位置
            start = prev?.next
            
            // fast 指针指向第k个节点
            for _ in 1...k {
                if fast == nil {
                    break
                }
                fast = fast?.next
            }
            
            // fast 已经走到链表尾端
            if fast == nil {
                break
            }
            
            // 对k范围内的链表翻转
            for _ in 1..<k {
                curr = prev?.next // prev -> (curr -> ... -> fast) ->
                prev?.next = curr?.next // prev -> ( .. -> fast) ->
                curr?.next = fast?.next
                fast?.next = curr // prev -> ( .. -> fast -> curr) ->
            }
        }
        
        return dummy.next
    }
}
