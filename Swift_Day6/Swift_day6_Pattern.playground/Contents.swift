//Pattern

import UIKit
//Wildcard Pattern
for _ in 1...3 {
    print("Hello_world")
    // Do something three times.
}

var p: String? = nil


p = "test";

switch p {
case _?:
    print ("Has String")
case nil:
    print ("No String")
}

//Identifier Pattern
let someValue = 42

//Value-Binding Pattern
let point = (3, 2)
switch point {
    // Bind x and y to the elements of point.
case let (x, y):
    print("The point is at (\(x), \(y)).")
}
// prints "The point is at (3, 2).”


let points = [(0, 0), (1, 0), (1, 0), (2, 0), (2, 0)]
for (x,y) in points {
    print(x,y)
    
    /* ... */
}
//Enumeration Case Pattern
enum Direction {
    case North, South, West, East
}
let myDir = Direction.West
switch myDir {
case .North: print("you're going north")
case .South: print("you're going south")
case .West: print("you're going west")
case .East: print("you're going east")
}


let someOptional: Int? = 42
// Match using an enumeration case pattern
if case .Some(let x) = someOptional {
    print(x)
}

if case .Some(let y) = someOptional {
    print(y)
}


// Match using an optional pattern
if case let x? = someOptional {
    print(x)
}

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5,nil,8,9,nil]
// Match only non-nil values
for case let number? in arrayOfOptionalInts {
    number
}
//Type-Casting Patterns
// is type: Matches the runtime type (or a subclass of it) against the right hand side. This performs a type cast but disregards the returned type. So your case block won't know about the matched type.

let a: Int = 5
//let a: Any = 5
switch a {
    // this fails because a is still anyobject
    // error: binary operator '+' cannot be applied to operands of type 'Any' and 'Int'
case is Int:
    print (a + 1)
    // This works and returns '6'
case let n as Int:
    print (n + 1)
default: ()
}


//Expression Pattern

let pointOther = (1, 2)
switch pointOther {
case (0, 0):
    print("(0, 0) is at the origin.")
case (-2...2, -2...2):
    print("(\(pointOther.0), \(pointOther.1)) is near the origin.")
default:
    print("The point is at (\(pointOther.0), \(pointOther.1)).")
}


// Tuple matching

func timeElapsed(interval: Double) -> (hour:Int, minutes: Int, seconds: Int) {
    let hours   = Int(floor(interval/3600))
    let minutes = Int(floor((interval-Double(hours*3600))/60))
    let seconds = Int(trunc(interval - Double(hours*3600)) - Double(minutes*60))
    return(hour:hours, minutes: minutes, seconds: seconds)
}

func timeAsLongStyle(interval: Double) -> String {
    let (hour,min, sec) = timeElapsed(interval)
    switch (hour,min, sec) {
    case (0,0,0..<60):
        return "0\(sec) sec"
    case (_ ,0, 0..<60):
        return "\(min) min 0\(sec) sec"
    case (_ ,_ , 0..<60):
        return "\(hour) hours 0\(min) min 0\(sec) sec"
    default:
        return "\(min) min \(sec) sec"
    }
}

timeAsLongStyle(3999)

//Expression matching:
let point_other = (1, 2)
switch point_other {
case (0, 0):
    print("(0, 0) is at the origin.")
case (-2...2, -2...2):
    print("(\(point_other.0), \(point_other.1)) is near the origin.")
default:
    print("The point is at (\(point_other.0), \(point_other.1)).")
}
// prints "(1, 2) is near the origin.”

//Value-binding pattern
let point_origin = (3, 2)
switch point {
    // Bind x and y to the elements of point.
case let (x, y):
    print("The point is at (\(x), \(y)).")
}
// prints "The point is at (3, 2).”
