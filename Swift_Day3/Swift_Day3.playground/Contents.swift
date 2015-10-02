//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Square {
    var length: Int = 1
    init(lenght1:Int){
        self.length = lenght1
    }
    
}

var firstSquare = Square(lenght1: 3)

print(firstSquare.length)





func AddAndSubtractTenFromNumber(let number: Int,_ number2:Int,var string:String) -> (small: Int, large: Int)
{
    
    string = "4"

    let smallResult = (number - 10)
    let largeResult = (number + 10)
    
    return (smallResult, largeResult)
}
var add = AddAndSubtractTenFromNumber(6,7,string: " a")


add.0
add.large





