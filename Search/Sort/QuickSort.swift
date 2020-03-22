//
//  QuickSourt.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/18.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class QuickSort {
    public static func sort(_ arr: [Int]) -> [Int] {
        if arr.count == 1 { return arr }
        var arr = arr
        quickSort(&arr, 0, arr.count - 1)
        return arr
    }
    
    static func quickSort(_ arr: inout [Int], _ lo: Int, _ hi: Int) {
        if hi <= lo { return }
        let index = partition2(&arr, lo, hi)
        quickSort(&arr, lo, index - 1)
        quickSort(&arr, index + 1, hi)
    }
    
    // Rearranges the arry to 2 parts:
    // All elements in first part is smaller than
    // All elements in second part.
    static func partition(_ arr: inout [Int], _ lo: Int, _ hi: Int) -> Int {
//        guard arr.count > 1 else { return 0 }
        let comprable = arr[lo] // Select a comparable element
        var left = lo, right = hi+1 // Scan from left and right
        while true { // if left has not met right
            repeat{ right -= 1 } while arr[right] > comprable // Find the first element smaller than comparable
            repeat{ left += 1 } while arr[left] < comprable   // Find the first element greater than comparable
            if left >= right { break } // if met
            
            // Exchange left and right
            let temp = arr[left]
            arr[left] = arr[right]
            arr[right] = temp
        }
        // Exchange comparable element and right
        if right > 0 {
            arr[lo] = arr[right]
            arr[right] = comprable
        }
//
        return right
    }
    
    // pivot: Randomly select a element, all elements less than `pivot` in the left side, and all greater than `pivot` in the right side.
    static func partition2(_ arr: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        var pivot = lo
        let pivotVal = arr[pivot]
        var i = lo // i: tail of all less-than elemtns
        var j = lo // j: scan the array to fine an element less than pivot
        while j <= hi {
            if arr[j] < pivotVal {
                // found an element less than the pivot.
                // swap arr[i] and arr[j].
                swap(&arr, j, i)
                if pivot == i { pivot = j } // keep pivot the correct position
                i += 1
                j += 1
            } else {
                j += 1 // keep scanning.
            }
        }
        
        // swap pivot and i, as `i` representing the tail of all less-than-pivot elements, so it is the head of all greater-than-pivot elements before swapping.
        swap(&arr, i, pivot)
        pivot = i
        return pivot
    }
    
    static func swap(_ arr: inout [Int], _ from: Int, _ to: Int) {
        let temp = arr[to]
        arr[to] = arr[from]
        arr[from] = temp
    }
}
