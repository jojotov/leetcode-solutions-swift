//
//  500_KeyboardRow.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation


/*:
 ### 500. Keyboard Row

 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.

 Example 1:

 ```
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 ```
 
 Note:
 
 1. You may use one character in the keyboard more than once.
 2. You may assume the input string will only contain letters of alphabet.

 */

class Solution_500 {

    func checkWord(_ word: String) -> Bool {
        var keybord = [
            ["q","w","e","r","t","y","u","i","o","p"],
            ["a","s","d","f","g","h","j","k","l"],
            ["z","x","c","v","b","n","m",]
        ]
        
        var start = word.startIndex
        var index = 0
        for i in 0..<keybord.count {
            if keybord[i].contains(String(word[start])) {
                index = i
                break;
            }
        }
        
        while start != word.endIndex {
            if !keybord[index].contains(String(word[start])) {
                return false
            }
            start = word.index(start, offsetBy: 1)
        }
        return true
    }
    
    func findWords(_ words: [String]) -> [String] {
        var checkedWords: [String] = []
        for word in words {
            if checkWord(word.lowercased()) {
                checkedWords.append(word)
            }
        }
        
        return checkedWords
    }
}
