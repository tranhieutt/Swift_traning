//: Playground - noun: a place where people can play

import UIKit
//Guard

func fooGuard(x: Int?) {
    guard let x = x where x > 0 else {
        // Value requirements not met, do something
        print("do sth")
        return
    }
    // Do stuff with x
    x.description
}
//fooGuard(6)
fooGuard(-9)

//switch statement
var testVar = "three"
var result = 0
switch(testVar) {
case "one":
    fallthrough
case "two":
    result = 2
case "three":
    result = 3
    fallthrough
case "four":
    result = 4
case "five":
    result = 5
default:
    result = 6
}
result
//defer
for i in 1...5 {
    print ("In \(i)")
    defer {
        print ("Deferred \(i)")
    }
    print ("Out \(i)")
}
/*In 1
Out 1
Deferred 1
In 2
Out 2
Deferred 2
In 3
Out 3
Deferred 3
In 4
Out 4
Deferred 4
In 5
Out 5
Deferred 5
*/
func f() {
    defer { print("First") }
    defer { print("Second") }
    defer { print("Third") }
}
f()
//Third -> Second -> First
 