//
//  MergeSort.swift
//  LeetcodeSolutionSwift
//
//  Created by jojo on 2020/3/18.
//  Copyright © 2020 jojo. All rights reserved.
//

import Foundation

public class MergeSort {
    public static func sort(_ arr: [Int]) ->[Int] {
        if arr.count <= 1 { return arr }

        let mid = Int(floor(Double(arr.count / 2)))
        let arr1 = sort(Array(arr[0..<mid]))
        let arr2 = sort(Array(arr[mid...(arr.count-1)]))
        return merge(arr1, arr2)
    }
    
    static func merge(_ arr1:[Int], _ arr2: [Int]) -> [Int] {
        if arr1.count == 0 { return arr2 }
        if arr2.count == 0 { return arr1 }
        
        var result: [Int] = []
        var i = 0, j = 0
        while i < arr1.count && j < arr2.count {
            if arr1[i] < arr2[j] {
                result.append(arr1[i])
                i += 1
            }
            else {
                result.append(arr2[j])
                j += 1
            }
        }
            
        if arr1.count > i { result.append(contentsOf: Array(arr1[i..<arr1.count])) }
        if arr2.count > j { result.append(contentsOf: Array(arr2[j..<arr2.count])) }
        
        return result
    }
}
