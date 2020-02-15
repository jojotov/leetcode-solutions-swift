//
//  367_ValidPerfectSquare.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

/*:
 ## 367. Valid Perfect Square
 ### Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 ```
 Input: 16
 Returns: True
 ```
 
 ```
 Input: 14
 Returns: False
 ```
 */

func isPerfectSquare(_ num: Int) -> Bool {
    if num == 0 {return true}
    for i in 1...num {
        if i * i > num {return false}
        else if i * i == num {return true}
    }
    
    return false
}

