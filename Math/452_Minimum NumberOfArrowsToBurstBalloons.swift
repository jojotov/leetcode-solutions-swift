//
//  452. Minimum NumberOfArrowsToBurstBalloons.swift
//  LeetcodeSolutionSwiftHost
//
//  Created by jojo on 2020/2/15.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation


/*:
 ## 452. Minimum Number of Arrows to Burst Balloons
 
 There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.
 
 An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.
 
 Example:
 
 > Input:
 > [[10,16], [2,8], [1,6], [7,12]]
 >
 > Output:
 > 2
 >
 > Explanation:
 > One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).
 */

class Solution_452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        
        //sorted with each baloons' min x
        var sortedPoints = points.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        }
        //calculate
        var arrow = 1
        var arrowLimit = sortedPoints[0][1]
        for balloon in sortedPoints {
            if balloon[0] <= arrowLimit {
                arrowLimit = min(balloon[1], arrowLimit)
            } else {
                arrow += 1
                arrowLimit = balloon[1]
            }
        }
        
        return arrow
    }
}
