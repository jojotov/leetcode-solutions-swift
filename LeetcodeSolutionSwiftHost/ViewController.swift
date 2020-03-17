//
//  ViewController.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/3/1.
//  Copyright © 2020 jojo. All rights reserved.
//

import UIKit
import LeetcodeSolutionSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        var node1: ListNode? = ListNode(1)
//        node1?.push(3)
//        node1?.push(2)
//        var node2: ListNode? = ListNode(1)
//        node2?.push(3)
//        node2?.push(2)
//
//        ListNode.move(source: &node1, to: &node2)
//        node1?.print()
//        node2?.print()
//
//        let shuffleMerged = ListNode.shuffleMerge(l1:node1,l2:node2)
//        shuffleMerged?.print()
//        let sortedMerged = ListNode.sortedMerge(l1:node1, l2:node2)
//        sortedMerged?.print()

        let doubleList: DoubleList<Int> = DoubleList(1)
        doubleList.append(2)
        doubleList.add(1)
        doubleList.print()
        doubleList.removeLast()
        doubleList.print()
        

        let cache = LRUCache(2 /* 缓存容量 */)
//        cache.put(1, 1)
//        cache.put(2, 2)
//        print("Get 1: \(cache.get(1)), should return: 1")       // 返回  1
//        cache.put(3, 3)           // 该操作会使得密钥 2 作废
//        print("Get 2: \(cache.get(2)), should return: -1")      // 返回 -1 (未找到)
//        cache.put(4, 4)           // 该操作会使得密钥 1 作废
//        print("Get 1: \(cache.get(1)), should return: -1")      // 返回 -1 (未找到)
//        print("Get 3: \(cache.get(3)), should return: 3")      // 返回 3
//        print("Get 4: \(cache.get(4)), should return: 4")      // 返回 4

//
//        let cache2 = LRUCache(1 /* 缓存容量 */)
//        cache2.put(2, 1)
//        print("Get 1: \(cache2.get(2)), should return: 1")       // 返回  1
//        cache2.put(3, 2)           // 该操作会使得密钥 2 作废
//        print("Get 2: \(cache2.get(2)), should return: -1")      // 返回 -1 (未找到)
//        print("Get 3: \(cache2.get(3)), should return: 2")      // 返回 3
        
        
//        print("Solution 209: \(Solution_209.minSubArrayLen(7, [2,3,1,2,4,3]))")
//        print("Solution 3: \(Solution_3.lengthOfLongestSubstring("abcc"))")
//
//        var s26 = [0,0,2,3,3]
//        Solution_26.removeDuplicates(&s26)
//        print("Solution 26: \(s26)")
//        print("Solution 567: \(Solution_567.checkInclusion("a", "ab"))")
//
//
        print("solution 343: \(Solution_343.integerBreak1(10))")
        
        
//        let pq = PriorityQueue<Int>(-1)
//        pq.insert(5)
//        pq.insert(1)
//        pq.insert(4)
//        print("Pop : \(pq.pop())") // should be 1
//        print("Pop : \(pq.pop())") // should be 4
//        pq.insert(6)
//        pq.insert(2)
//        print("Pop : \(pq.pop())") // should be 2
//        print("Pop : \(pq.pop())") // should be 5

    }


    
}

