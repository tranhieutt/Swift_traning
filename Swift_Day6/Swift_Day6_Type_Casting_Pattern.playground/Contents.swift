//: Playground - noun: a place where people can play

import UIKit

class Animal {
    func bark() -> String {
        return "$&%#"
    }
}
protocol bomb {
    func bombing() ->String
}
class Dog: Animal {
    override func bark() -> String {
        return "woof-woof"
    }
}
class Terrorism: bomb {
    func bombing() -> String{
       return "Bombing bombing"
    }
}
let things: [Any] = [0, 0.0, Animal(), Dog(),Terrorism()]

for thing in things {
    switch thing {
        // thing is determined whether or Int. I use is when not interested in the value itself
    case is Int:
        print("thing is Int value")
    case is Double:
        print("thing is Double")
        // Thing it is determined to match a Dog
        // (Or the right side of the type or its subtypes of as),
        // If there is a match, get a dog that has been cast on the Dog
    case let dog as Dog:
        print("Dog barks " + dog.bark())
    case let animal as Animal:
        print("Animal barks " + animal.bark())
    case let terrorism as Terrorism:
        print("terrorism is " + terrorism.bombing())
    default:
        print("something else")
    }
}