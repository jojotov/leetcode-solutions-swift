//
//  Int_62_LastRemaining.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/30.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 面试题62. 圆圈中最后剩下的数字
 0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

  
 示例 1：
 输入: n = 5, m = 3
 输出: 3

 示例 2：
 输入: n = 10, m = 17
 输出: 2

*/


public class Solution_Int62 {
    static public func lastRemaining(_ n: Int, _ m: Int) -> Int {
//        var head: DoubleListNode = DoubleListNode(0)
        let list: DoubleList = DoubleList(0)
        var arr: [DoubleListNode<Int>] = [] // 数组保证查询操作 O(1)
        var k = 0 // 每次删除递增，记录下一个需要删除的元素在数组中的位置
        var index = 0 // 删除的索引
        for i in 1..<n {
            let node = DoubleListNode(i)
            list.append(node)
            arr.append(node)
        }
        list.tail.next = list.head
        list.head.prev = list.tail
        
        while list.size() > 1 {
            index = (index+m-1) % (n-k)
            k += 1

            let curr = arr[index]
            print("removing: \(curr.val!)")
            // delete node
            list.remove(curr)
        }
        
        return list.removeLast()!.val!
    }
}
