//: Playground - noun: a place where people can play

import Cocoa

/*
 * Public definitions
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/*:
 ## 1. Two Sum
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.


 ```
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 ```
 
 */
class Solution_1 {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            let num = nums[i]
            if let mapped = map[target - num] {
                return [mapped,i]
            }
            map[num] = i
        }
        return []
    }
}

//Solution_1.twoSum([2, 7, 11, 15], 9)

/*:
 ## 2. Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 ```
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 ```
 */

class Solution_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var result: ListNode? = nil
        var resultHead = result
        var count: Int = 0
        while l1 != nil || l2 != nil || count == 1 {
            let value =  (l1?.val ?? 0) + (l2?.val ?? 0) + count
            if result == nil {
                result = ListNode(value % 10)
                resultHead = result
            } else {
                result!.next = ListNode(value % 10)
                result = result!.next
            }
            count = (value >= 10) ? 1 : 0
            l1 = l1?.next
            l2 = l2?.next
        }
        return resultHead
    }
}

/*:
 ## 3. Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given `"abcabcbb"`, the answer is `"abc"`, which the length is 3.
 
 Given `"bbbbb"`, the answer is `"b"`, with the length of 1.
 
 Given `"pwwkew"`, the answer is `"wke"`, with the length of 3. Note that the answer must be a substring, `"pwke"` is a subsequence and not a substring.
*/

class Solution_3 {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0;
        }
        var count = 0
        var map: [Character : Int] = [:]
        var j = 0
        for i in 0...s.count - 1 {
            let index = s.index(s.startIndex, offsetBy: i)
            let char = s[index]
            if map.keys.contains(char) {
                j = max(j, map[char]! + 1)
            }
            map[char] = i
            count = max(count, i - j + 1)
        }
        return count
    }
}

Solution_3.lengthOfLongestSubstring("abcabcbb")
Solution_3.lengthOfLongestSubstring("pwwkew")
//Solution_3.lengthOfLongestSubstring("bbbbb")


