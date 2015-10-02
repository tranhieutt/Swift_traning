//: Playground - noun: a place where people can play

import UIKit

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

// prints "SomeSubClass”

if someInstance.dynamicType === someInstance.self {
    print("The dynamic type of someInstance is SomeBaseCass")
} else {
    print("The dynamic type of someInstance isn't SomeBaseClass")
}
// prints "The dynamic type of someInstance isn't SomeBaseClass”


class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}
let metatype: AnotherSubClass.Type = AnotherSubClass.self
let anotherInstance = metatype.init(string: "some string")
