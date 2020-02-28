//
//  92_ReverseBetween.swift
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
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution_92 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard let head = head else { return nil  }
        if m >= n { return head }
        
        // 临时指针保持链表头
        let dummy = ListNode(-1)
        dummy.next = head

        var prev = dummy
        var start = dummy.next // 开始指针
        for _ in 1..<m {
            guard let next = prev.next else {
                // 超出范围
                return dummy.next
            }
            prev = next
        }
        var end = dummy.next // 结束指针
        for _ in 1..<n {
            if end == nil {
                // 超出范围
                break
            }
            end = end?.next
        }

        // 范围反转
        // prev 为区间外的尾节点，start 为区间内头节点，end 为区间尾节点
        // 循环：start 插入 end 后面，prev->next 指向 start->next，start->next 指向 end->next
        for _ in 1...(n-m) {
            start = prev.next
            prev.next = start?.next
            start?.next = end?.next
            end?.next = start
        }
               
        return dummy.next
    } 
}
