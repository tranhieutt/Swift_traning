//: Playground - noun: a place where people can play

import UIKit

var str = "Swift Day 06"

// Lexical strucure
// Literals
//var a = 10
//var b = 10.4
//var hello = "Swift day 06"
////Binary integer literal 20
//var b_literal = 0b00010100
////Hexadecimal integer literal 20: 1x16 + 4
//var hexa_literal = 0x14
////Octal integer literal 20: 2x8+4
//var octal_literal = 0o24
//// Underscore
//var _underScore = 99_000_345_001

//_underScore += 5_000

//Simple floating point number
var a = 10.5
//Exponent floating point number for 1050
var b = 10.5e2
//Exponent floating point number for 0.1050: 10.5x10^-2
var c = 10.5e-2
//Hexa decimal exponent floating point number for 40: A=10x2^1
var d = 0xAp1
var _d = 0xAp2
var __d = 0xAp3

var D = 0xAp11
var ___d = 0xBp1
var ____d = 0xBp2
//Hexa decimal exponent floating point number for 2.5: 10x2^-2 = 10/4
var _____d = 0xAp-1
var ______d = 0xAp-2
var _______d = 0xAp-3



"1 2 3"
"1 2 \(3)"
"1 2 \(1 + 2)"
let x = 3;
"1 2 \(x)"

var string = "Hello\(x)"



func findStockCode(company: String) -> String? {
    
    if(company == "Apple") {
        
        return "AAPL"
        
    } else if (company == "Google") {
        
        return "GOOG"
        
    }
    
    return nil
}

var stockCode:String? = findStockCode("Facebook")

//let text = "Stock Code - "



//let message = text + stockCode! // compile-time error


let text = "Stock Code - "

if var stockCode = findStockCode("Facebook") {
    
    let message = text + stockCode
    
    print(message)
    
}
let errorCode :Dictionary<String,Int>? = ["errorCode":404]

let arr :[Int] = [1,3]


var brokenArray: [AnyObject] = [arr, 1, 12.23, true, "tes",errorCode!]



let successCode : [String:Int] = ["successCode":200]

brokenArray.insert(successCode, atIndex: 5)


let possibleNumber : String? = "123"
var convertNubmer = Int(possibleNumber!)

convertNubmer = nil;


if convertNubmer != nil {
    print("Convert contain interger value")
} else {
    print("Convert is nil")
}

if let actual = Int(possibleNumber!) {
    print(actual)
}




















