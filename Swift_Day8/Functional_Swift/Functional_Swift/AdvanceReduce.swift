//
//  AdvanceReduce.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation

class AdvanceReduce {
    
    typealias Entry = [Character:[String]]
    
    // Imperative
    static func buildIndexImperative(words: [String]) -> Entry {
        var result = Entry()
        
        // Create Index
        for word in words {
            let firstLetter = word.uppercaseString[word.startIndex]
            result[firstLetter] = (result[firstLetter] ?? []) + [word]
        }
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    // Funtional
//    func buildIndexDeclarative(words: [String]) -> [Character:[String]] {
//        let index = words.reduce([Character:[String]]()) {
//            (var dict, nextString) in
//            let firstLetter = nextString.uppercaseString[nextString.startIndex]
//            dict[firstLetter] = (dict[firstLetter] ?? []) + [nextString]
//            return dict
//        }
//        print(index)
//        return index
//    }
}