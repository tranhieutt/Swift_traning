//: Playground - noun: a place where people can play

import UIKit

let someTuple: (Double, Double) = (3.14159, 2.71828)

func someFunction(a: Int) { /* ... */ }


typealias Point = (Int, Int)
let start_origin: Point = (0, 0)
let end_origin: Point = (1,1)
start_origin.0

typealias Point_3D = (Int, Int, Int)
let x_point : Point_3D = (0, 0, 0)
let y_point : Point_3D = (1, 1, 1)
let z_point : Point_3D = (2, 2, 2)

//typealias 3D_Point = (Int, Int, Int)  -> not accept!

//Tuble type:
let total :Double = 10
let taxPct : Double = 0.4
let subtotal = total / (taxPct + 0.1)
func calcTipWithTipPct(tipPct:Double,str:String) -> (tipAmt:Double, total:Double, str:String) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal,str)
}
calcTipWithTipPct(5,str: "Hello_World")


//Array type
let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArrayOther: [String] = ["Alex", "Brian", "Dave"]

//multidimensional arrays
var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8, 9]]]

array3D[0]
array3D[1]

array3D[0][1]
array3D[0][1][0]


var array3D_Other: [[(Int, String)]] = [[(1, "a"), (3, "b")], [(5, "c"), (7,"d")]]

array3D_Other[0][0].1
array3D_Other[1][1].1

//Optional type:
var optionalInteger: Int?
var optionalIntegerOther: Optional<Int>


optionalInteger = 42;
optionalInteger



var implicitlyUnwrappedString: String!
var implicitlyUnwrappedStringOther: ImplicitlyUnwrappedOptional<String>


protocol SomeProtocol1 {
    func method1()
    func method2()
}

protocol SomeProtocol2 {
    func method3()
    func method4()
}
protocol SomeProtocol3: SomeProtocol1, SomeProtocol2 {
    func method5()
    func method6()
}

class Car: SomeProtocol3 {
    func method5() {
    }
    func method6() {
    }
    func method3() {
    }
    func method4() {
    }
    func method2() {
    }
    func method1() {
    }
}
func someMethod(firstMethodParam: String, secondMethodParam: protocol<SomeProtocol1, SomeProtocol2>) {
    secondMethodParam.method1()
    secondMethodParam.method2()
    secondMethodParam.method3()
    secondMethodParam.method4()
}
let car = Car()
car.method6()
someMethod("a string", secondMethodParam: car)

// Metatype Type

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// The compile-time type of someInstance is SomeBaseClass,
// and the runtime type of someInstance is SomeBaseClass
someInstance.dynamicType.printClassName()
// prints "SomeSubClass"








