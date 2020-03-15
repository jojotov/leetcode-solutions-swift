//
//  567_CheckInclusion.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/5.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 567. 字符串的排列

 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。
 换句话说，第一个字符串的排列之一是第二个字符串的子串。

 示例1:

 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
  

 示例2:

 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
  

 注意：

 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间

 */

public class Solution_567 {
    public static func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {return false}
        let charsInString1 = Array(s1)
        let charsInString2 = Array(s2)
        var left = 0, right = 0
        var needs:[Character:Int] = [:], window:[Character:Int] = [:]
        for char in charsInString1 {
            if let s1CharCount = needs[char] {
                needs[char] = s1CharCount + 1
            } else {
                needs[char] = 1
            }
            if let s2CharCount = window[charsInString2[right]] {
                window[charsInString2[right]] = s2CharCount + 1
            } else {
                window[charsInString2[right]] = 1
            }
            right += 1
        }
        
        if mapMatch(window, needs) {
            return true
        }
        
        while right < charsInString2.count {
            if let s2CharCount = window[charsInString2[left]] {
                if s2CharCount == 1 {
                    window[charsInString2[left]] = nil
                } else {
                    window[charsInString2[left]] = s2CharCount - 1
                }
            }
            if let s2CharCount = window[charsInString2[right]] {
                window[charsInString2[right]] = s2CharCount + 1
            } else {
                window[charsInString2[right]] = 1
            }

            if mapMatch(needs, window) {
                return true
            }
            right += 1
            left += 1
        }
        return mapMatch(needs, window)
    }
    
    static func mapMatch(_ map1: [Character:Int], _ map2: [Character:Int]) -> Bool {
        for char in Array("abcdefghijklmnopqrstuvwxyz") {
            if map1[char] != map2[char] {
                return false
            }
        }
        return true
    }
}
