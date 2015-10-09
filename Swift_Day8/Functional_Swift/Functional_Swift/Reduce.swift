//
//  Reduce.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation

class Reduce {
    
    // Imperative
    func reduceImperative() {
        var evens = [Int]()
        for i in 1...10 {
            if i % 2 == 0 {
                evens.append(i)
            }
        }
        
        var evenSum = 0
        for i in evens {
            evenSum += i
        }
        
        print(evenSum)
    }
    
    // Declarative
    func reduceDelcarative() {
        let evenSum = Array(1...10)
            .filter { (number) in number % 2 == 0 }
            .reduce(0) { (total, number) in total + number }
        
        print(evenSum)
    }
}

extension Array {
    func myReduce<T, U>(initial:U, combiner:(U, T) -> U) -> U {
        var current = initial
        for item in self {
            current = combiner(current, item as! T)
        }
        return current
    }
}