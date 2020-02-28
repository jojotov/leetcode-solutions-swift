//
//  234_Palindrome.swift
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
 请判断一个链表是否为回文链表。

 示例 1:
 输入: 1->2
 输出: false
 
 示例 2:
 输入: 1->2->2->1
 输出: true
 
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution_234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        // find mid point
        var p1 = head, p2 = head
        while p2?.next?.next != nil{
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        
        // check odd
        if p2?.next != nil {
            p2 = p2?.next
        }
                
        // reversed
        var reversedPrev = p1
        var curr = p1?.next
        while curr != nil {
            let temp = curr?.next
            curr?.next = reversedPrev
            reversedPrev = curr
            curr = temp
        }
        
        // check palindrome
        p1?.next = nil
        var head = head
        while head != nil {
            if head?.val != p2?.val { return false }
            head = head?.next
            p2 = p2?.next
        }
        
        return true
    }
}
