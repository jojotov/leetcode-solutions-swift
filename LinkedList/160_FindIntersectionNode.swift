//
//  160_FindIntersectionNode.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/17.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 160. 相交链表
 
 思路：
 因为相交的链表必定是 Y 型。
 1. 两个指针，指针 a 从链表 a 开始，指针 b 从链表 b 开始
 2. 当其中一个指针走到尾时换到另一个链表
 3. 相交的点为交点
 */

class Solution_160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1: ListNode? = headA, p2: ListNode? = headB
        var count = 0
        while p1 != nil && p2 != nil {
            if p1 === p2 {
                return p1
            }
            
            if p2 == nil && count != 2 {
                p2 = headA
                count += 1
                p1 = p1?.next
            }
            else if p1 == nil && count != 2 {
                p1 = headB
                count += 1
                p2 = p2?.next
            } else {
                p1 = p1?.next
                p2 = p2?.next
            }
            
        }
        
        return p1 // 返回交点
    }
}
