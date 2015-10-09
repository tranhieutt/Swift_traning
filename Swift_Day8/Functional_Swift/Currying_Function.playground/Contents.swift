//: Playground - noun: a place where people can play

import UIKit

func add1(x: Int, _ y: Int) -> Int {
    return x + y
}
add1(1, 2) // Output: 3

func add2(x: Int) -> (Int -> Int) {
    return { y in return x + y }
}
add2(1)(2) // Output: 3


func add3(x: Int)(y: Int) -> Int {
    return x + y
}
add3(1)(y: 2) // Output: 3


// Apply map to the array using the two functions
let xs = [1, 2, 3]
let addSeven1 = { add1($0, 7) }
let addSeven2 = add2(7)

xs.map(addSeven1) // Output: [8, 9, 10]
xs.map(addSeven2) // Output: [8, 9, 10]


// Define a new operator |> that has left associativity
infix operator |> { associativity left }
func |> <A, B, C>(f: B -> C, g: A -> B) -> A -> C {
    return { x in
        f(g(x))
    }
}


let addThree = add2(3)
// Apply addSeven1 to every item in xs
// Then apply addThree to every item in that list
xs.map(addSeven1).map(addThree) // Output: [11, 12, 13]

// Currying
xs.map(addSeven1 |> addThree) // Output: [11, 12, 13]