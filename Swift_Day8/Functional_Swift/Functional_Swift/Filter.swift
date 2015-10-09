//
//  Filter.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/7/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation
class Filter {
    // Imperative
   static func filterImperative() {
        var evens = [Int]()
        for i in 1...10 {
            if i % 2 == 0 {
                evens.append(i)
            }
        }
        print(evens)
    }
    
    // Declarative
    func filterDeclarative() {
        func isEven(number: Int) -> Bool {
            return number % 2 == 0
        }
        let evens = Array(1...10).filter{ number in return number % 2 == 0 }
//        let evens = Array(1...10).filter(isEven)
//        let evens = Array(1...10).filter{$0 % 2 == 0}
        print(evens)
    }
    
    // Implement Filter
    func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in source {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
    
    func usingMyFilter() {
        let evens = myFilter(Array(1...10)) { $0 % 2 == 0 }
        print(evens)
    }
}

// Filter for Array using Extension
// you can use Element instead of <T>
extension Array {
    func arrayFilter <T>(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in self {
            if predicate(i as! T) {
                result.append(i as! T)
            }
        }
        return result
    }
}

