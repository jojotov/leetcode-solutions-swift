//
//  142_CycleList.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/17.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
class Solution_143 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // 1. 判断是否有环
        // 2. 找出环大小 n（相遇后记录位置，再次回到即环长度）
        // 3. 快指针先走 n 补
        guard let head = head else { return nil }
        var fast: ListNode? = head, slow: ListNode? = head
        
        while fast != nil && slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow { break }
        }
        
        if fast == nil || slow == nil { return nil } // 没有环
        let meet = fast // 记录相遇位置
        
        // 找出环长度
        var count = 1
        fast = fast?.next
        while fast != meet {
            count += 1
            fast = fast?.next
        }
        
        // fast 先走
        fast = head
        slow = head
        while count > 0 {
            fast = fast?.next
            count -= 1
        }
        
        while slow != fast {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}
