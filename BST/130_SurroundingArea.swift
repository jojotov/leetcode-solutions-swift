//
//  130_SurroundingArea.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/29.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class Solution_130 {
    public init() {}
    
    func isInBorder(_ i: Int, _ j: Int, m: Int, n: Int) -> Bool {
        if i == 0 || i == m { return true }
        if j == 0 || j == n { return true }
        return false
    }
    
    func replace(_ board: inout [[Character]], at indexes: [(Int,Int)], with element: Character) {
        if board.count == 0 { return }
        if indexes.count == 0 { return }
        for (i,j) in indexes {
            if i < 0 || i >= board.count { continue }
            if j < 0 || j >= board[i].count { continue }
            board[i][j] = element
        }
    }
    
    func bfs(_ board: [[Character]], with value: Character, at index: (Int, Int)) -> [(Int, Int)] {
        if board.count == 0 { return [] }
        if index.0 < 0 || index.0 >= board.count { return [] }
        if index.1 < 0 || index.1 >= board.first!.count { return [] }
        var result: [(Int, Int)] = []
        var queue: [(Int, Int)] = [index]
        var visited: [(Int, Int)] = []
        while !queue.isEmpty {
            var nextBFSQueue: [(Int, Int)] = []
            let (i,j) = queue.removeFirst()
            visited.append((i,j))
            if (board[i][j] != value) {
                continue
            }
            result.append((i,j))
            
            // left: (i,j-1)
            if j-1 >= 0 && !visited.contains { $0.0 == i && $0.1 == j-1 } {
                nextBFSQueue.append((i,j-1))
            }
            // right: (i,j+1)
            if j+1 < board[i].count && !visited.contains { $0.0 == i && $0.1 == j+1 } {
                nextBFSQueue.append((i,j+1))
            }
            // up: (i-1,j)
            if i-1 >= 0 && !visited.contains { $0.0 == i-1 && $0.1 == j } {
                nextBFSQueue.append((i-1,j))
            }
            // down: (i+1,j)
            if i+1 < board.count && !visited.contains { $0.0 == i+1 && $0.1 == j } {
                nextBFSQueue.append((i+1,j))
            }

            if !nextBFSQueue.isEmpty { queue.append(contentsOf: nextBFSQueue) }
        }
        return result
    }
    
    public func solve(_ board: inout [[Character]]) {
        if board.count == 0 { return }
        let m = board.count - 1
        let n = board.first!.count - 1
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "O" {
                    let bfsResult = bfs(board, with: Character("O"), at: (i,j))
                    if !bfsResult.contains(where: { (i,j) -> Bool in
                        return isInBorder(i, j, m: m, n: n)
                    }) {
                        replace(&board, at: bfsResult, with: Character("X"))
                    }
                }
            }
        }
    }
}
