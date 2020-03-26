//
//  1143_LCS.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/23.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation
/*:
 1143. 最长公共子序列
 
 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列。

 一个字符串的*子序列*是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。

 若这两个字符串没有公共子序列，则返回 0。

 示例 1:

 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace"，它的长度为 3。
 示例 2:

 输入：text1 = "abc", text2 = "abc"
 输出：3
 解释：最长公共子序列是 "abc"，它的长度为 3。
 示例 3:

 输入：text1 = "abc", text2 = "def"
 输出：0
 解释：两个字符串没有公共子序列，返回 0。
  

 思路：
 例如 "abc" 和 "ab", 建立 dp table：
     " " "a" "b" "c"
 " "  0   0   0   0   // " "   vs. " ", " a", " ab", " abc"
 "a"  0   1   1   1   // " a"  vs. " ", " a", " ab", " abc"
 "b"  0   1   2   2   // " ab" vs. " ", " a", " ab", " abc"
                  ^
                  |
                 LCS
 */
public class Solution_1143 {
    static public func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.count == 0 || text2.count == 0 { return 0 }
        let text1Chars = [Character(" ")] + Array<Character>(text1), text2Chars =  [Character(" ")] + Array<Character>(text2)
        var dp: [Int: [Int: Int]] = [:]
        for i in 0..<text1Chars.count { dp[i] = [:] }

        for i in 0..<text1Chars.count {
            let char1 = text1Chars[i]
            for j in 0..<text2Chars.count {
                let char2 = text2Chars[j]
                if i == 0 || j == 0 { dp[i]![j] = 0 } // '' vs. any char is 0
                else if char1 == char2 {
                    dp[i]![j] = 1 + dp[i-1]![j-1]!
                } else {
                    dp[i]![j] = max(dp[i-1]![j]!, dp[i]![j-1]!)
                }
            }
        }
        
        return dp[text1Chars.count - 1]![text2Chars.count - 1]!
    }
}
