//
//  LRUCache.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/1.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*:
 由于 LRU 对查找、插入、删除的时间效率要求都非常高（O(1)），而且要求有序，因此需要在数据结构的考虑上需要注意。
 1. HashMap 查找效率 O(1)，但是数据存储没有顺序
 2. LinkedList 数据存储有序，插入删除快，但是查找速度较慢
 
 因此使用 HashMap 和双向链表结合。
  */

public class LRUCache {
    public static let undefinedValue = -1
    
    private var list: DoubleList<Dictionary<Int, Int>> = DoubleList([LRUCache.undefinedValue:LRUCache.undefinedValue])
    private var hashMap: Dictionary<Int, DoubleListNode<Dictionary<Int, Int>>>
    private var capacity: Int = 0
    
    public init(_ capacity: Int) {
        self.capacity = capacity
        self.hashMap = Dictionary(minimumCapacity: capacity)
    }
    
    public func get(_ key: Int) -> Int {
        guard let node = self.hashMap[key] else { return LRUCache.undefinedValue }

        // lru re-order
        // 1. find the node with key
        // 2. remove and insert
        self.list.remove(node)
        self.list.add(node)
        
        return node.val?.values.first ?? LRUCache.undefinedValue
    }
    
    public func put(_ key: Int, _ value: Int) {
        let nodeToAdd = DoubleListNode([key:value])

        if let node = hashMap[key] {
            list.remove(node)
            list.add(nodeToAdd)
            hashMap[key] = nodeToAdd
            return
        }
        
        if hashMap.count >= capacity {
            // remove last
            let removedNode = list.removeLast()
            if let keyToRemove = removedNode?.val?.keys.first {
                hashMap.removeValue(forKey: keyToRemove)
            }
        }
        
        list.add(nodeToAdd)
        hashMap[key] = nodeToAdd
    }
}
