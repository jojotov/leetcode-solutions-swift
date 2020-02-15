//
//  467_UniqueSubstringsInWraparoundString.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*: 467. Unique Substrings in Wraparound String
 
 Consider the string s to be the infinite wraparound string of "abcdefghijklmnopqrstuvwxyz", so s will look like this: "...zabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd....".
 
 Now we have another string p. Your job is to find out how many unique non-empty substrings of p are present in s. In particular, your input is the string p and you need to output the number of different non-empty substrings of p in the string s.
 
 Note: p consists of only lowercase English letters and the size of p might be over 10000.
 
 Example 1:
 ```
 Input: "a"
 Output: 1
 Explanation: Only the substring "a" of string "a" is in the string s.
 ```
 
 Example 2:
 ```
 Input: "cac"
 Output: 2
 Explanation: There are two substrings "a", "c" of string "cac" in the string s.
 ```
 
 Example 3:
 ```
 Input: "zab"
 Output: 6
 Explanation: There are six substrings "z", "a", "b", "za", "ab", "zab" of string "zab" in the string s.
 ```
*/

class Solution_467 {
    func findSubstringInWraproundString(_ p: String) -> Int {
        if p.count == 0 {
            return 0
        }
        
        var counts: [Int] = []
        var maxLength = 0
//
//        for i in 0..<p.count {
//            let stringIndex = p.index(p.startIndex, offsetBy: i)
//
//            if i > 0 {
//                if String(p[stringIndex]) - String(p[p.index(before: stringIndex)]) == 1,25 {
//                    maxLength += 1
//                }
//
//            } else {
//                maxLength = 1
//            }
//
//            let index = p[stringIndex] - "a"
//            counts[index] = max
//
//        }
//
        return counts.reduce(0,+)
    }
}
