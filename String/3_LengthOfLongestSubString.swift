//
//  3_LengthOfLongestSubString.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/4.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 3. 无重复字符的最长子

 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */

public class Solution_3 {
    static public func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0, right = 0, res = 0
        var window: [Character: Int] = [:]
        let characters: [Character] = Array(s)
        while right < characters.count {
            let c = characters[right]
            right += 1
            if window[c] == nil {
                window[c] = 1
            } else {
                window[c]! += 1
            }
            
            while window[c]! > 1/*substring existed*/{
                window[characters[left]]! -= 1
                left += 1
            }
            
            res = max(res, right - left)
        }
        return res
    }
}
