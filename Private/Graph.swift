//
//  Graph.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

struct Graph {
    var value: String
    var neighbours: [Graph]?
}

// MARK: BFS
extension Graph {
    func bfs(_ end: Graph) -> Int {
        var count = 1
        var queue: [Graph] = [self]
        var visited: [Graph] = [self]
        
        while queue.count > 0 {
            //dequeue current visiting
            let current = queue.removeFirst()
            if current.value == end.value {
                break
            }
            //traval neighbours
            if let neighbours = current.neighbours {
                count += 1
                for neighbour in neighbours {
                    if !visited.contains { $0.value == neighbour.value } {
                        queue.append(neighbour)
                        visited.append(neighbour)
                    }
                }
            }
        }
        
        return count
    }
}
