//: Playground - noun: a place where people can play

import UIKit

let words = ["Cat", "Chicken", "fish", "Dog",
    "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
    let letters = words.map {
        (word) -> Character in
        let index = word.startIndex
        return word[index]
    }
    print(letters)
    
//    let final: Array = letters.filter({ })
    
    
    return [Entry]()
}

let index = words.reduce([Character:[String]]()) {
    (var dict, nextString) in
    let fl = nextString.uppercaseString[nextString.startIndex]
    dict[fl] = (dict[fl] ?? []) + [nextString]
    return dict
}

print(index["C"])

print(buildIndex(words))
