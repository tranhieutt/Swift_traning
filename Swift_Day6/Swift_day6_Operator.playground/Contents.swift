//: Playground - noun: a place where people can play

import UIKit

//Overloading:overload * to repeat a string a specified number of times:
func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}

"bb" * 6
5 * 8
var b = 9
b*6

var str: String = "ab";
str * 8


// "aaaaaa"
//_ is a placeholder parameter name. It indicates that a parameter is expected, but will not be used. in indicates the end of a closure's type signature. This whole line defines a function that takes three parameters and does nothing.


var a:Array = [1,2] + [3,4]

a + [3,4]
"a" + "b"

1 + 2

infix operator ^^ { associativity left precedence 160 }

func ^^ (left: Double, right: Double) -> Double {
    return pow(left, right)
}

2 ^^ 3
let ab: Int = 3
let bb: Int = 3

let x: Int = Int(pow(Double(ab),Double(bb)))

//Custom Operators with Protocol and Method 

protocol RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions) throws -> Bool
}

extension String: RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions = []) throws -> Bool {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        return regex.numberOfMatchesInString(self, options: [], range: NSRange(location: 0, length: 0.distanceTo(utf16.count))) != 0
    }
}

infix operator =~ { associativity left precedence 130 }
func =~<T: RegularExpressionMatchable> (left: T, right: String) -> Bool {
    return try! left.match(right, options: [])
}

let cocoaClassPattern = "^[A-Z]{2,}[A-Za-z0-9]+$"

try? "NSHipster".match(cocoaClassPattern)       // true
"NSHipster" =~ cocoaClassPattern                // true

//prefix operator √ {}

prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

√4
// 2


//Or consider the ± operator, which can be used either as an infix or prefix to return a tuple with the sum and difference:

infix operator ± { associativity left precedence 140 }
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ± {}
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

2 ± 3
// (5, -1)

±4
// (4, -4)
//Type

let someTuple: (Double, Double) = (3.14159, 2.71828)
func someFunction(a: Int) -> Int {
    /* ... */
    let int : Int =  a * 4
    return int
}
someFunction(6)



