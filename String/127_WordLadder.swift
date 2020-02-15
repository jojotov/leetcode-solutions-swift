//
//  127_WordLadder.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 ## 127. Word Ladder
 ###  Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 
 For example,
 
 Given:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 */


class Solution_127 {
    func isNeighbour(with s1: String, and s2: String) -> Bool {
        var isNeighbour = false
        for i in 0..<s2.count {
            let index = s2.index(s2.startIndex, offsetBy: i)
            if s1[index] != s2[index] {
                if isNeighbour {
                    return false
                }
                isNeighbour = true
            }
        }
        return isNeighbour
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Create Grapth
        var map: [String : Graph] = [
            beginWord : Graph(value: beginWord, neighbours: []),
            endWord : Graph(value: endWord, neighbours: [])
        ]
        
        for word in wordList {
            map[word] = Graph(value: word, neighbours: [])
        }
        
        for (key, graph) in map {
            var graph = graph
            for i in 0..<wordList.count {
                let word = wordList[i]
                if let wordGraph = map[word] {
                    if isNeighbour(with: key, and: word) {
                        graph.neighbours?.append(wordGraph)
                    }
                }
            }
            map[key] = graph
        }
        
        
        // BFS
        return map[beginWord]!.bfs(map[endWord]!)
    }
}
