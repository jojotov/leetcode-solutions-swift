//
//  PriorityQueue.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/16.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class PriorityQueue<T: Comparable & Equatable> {
    private var compare: (T,T) -> Bool
    private var queue: [T] = []
    
    public init(_ dummy: T, compare: @escaping (T,T) -> Bool = { x,y in
        x < y
        }) {
        self.queue = [dummy]
        self.compare = compare
    }

    private var capacity: Int {
        queue.count - 1
    }
    
    private func parent(of index: Int) -> Int {
        if index % 2 == 0 { return index / 2}
        return (index - 1) / 2
    }
    private func leftChild(of index: Int) -> Int { index * 2 }
    private func rightChild(of index: Int) -> Int { leftChild(of: index) + 1 }
    private func atBottom(_ index: Int) -> Bool { leftChild(of: index) > capacity}
    
    public func insert(_ val: T) {
        queue.append(val)
        swim(from: capacity)
    }
    
    public func pop() -> T {
        exchange(1, capacity)
        let result = queue.removeLast()
        sink(from: 1)
        return result
    }
    
    private func swim(from index: Int) {
        var i = index
        while i > 1 && !compared(parent(of: i), i) { // if parent is not matched
            exchange(i, parent(of: i))
            i = parent(of: i)
        }
    }
    
    private func sink(from index: Int) {
        var i = index
        while !atBottom(i) {
            var childIndex = leftChild(of: i)
            // 找出两个子节点中更符合条件的那个
            if rightChild(of: i) <= capacity, compared(rightChild(of: i), childIndex) {
                childIndex = rightChild(of: i)
            }
            if compared(i, childIndex) { break }
            exchange(i, childIndex)
            i = childIndex
        }
    }
    
    private func exchange(_ from: Int, _ to: Int) {
        let temp = queue[from]
        queue[from] = queue[to]
        queue[to] = temp
    }
    
    private func compared(_ index0: Int, _ index1: Int) -> Bool {
        compare(queue[index0], queue[index1])
    }
}
