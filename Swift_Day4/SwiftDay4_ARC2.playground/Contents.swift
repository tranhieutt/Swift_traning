//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

import UIKit

//********************************************
//
// Strong Reference
//
//********************************************
class Animal {
    let name: String
    
    init (name: String) {
        print("Initializing: \(name)")
        self.name = name
    }
    
    deinit {
        print("Deallocating: \(self.name)")
    }
}

var shiba1: Animal?
var shiba2: Animal?
var shiba3: Animal?

shiba1 = Animal(name: "Shibi")
shiba2 = shiba1
shiba3 = shiba1

shiba1 = nil // Prints nothing
shiba2 = nil // Prints nothing
//shiba3 = nil // Deallocating: Shibi

//********************************************
//
// Strong Reference Cycles
//
//********************************************
//class Animal {
//    let name: String
//    var owner: Owner?
//
//    init (name: String) {
//        print("Initializing: \(name)")
//        self.name = name
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//class Owner {
//    let name: String
//    var pet: Animal?
//
//    init (name: String) {
//        print("Initializing: \(name)")
//        self.name = name
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//var shiba: Animal?
//var mari: Owner?
//
//shiba = Animal(name: "Shibi")
//mari = Owner(name: "Mari")
//
//shiba!.owner = mari
//mari!.pet = shiba

//shiba = nil // Prints nothing
//mari = nil // Prints nothing

//********************************************
//
// Weak Reference
//
//********************************************

//class Animal {
//    let name: String
//    // We use the weak keyword to declare a variable
//    // or property as a weak reference
//    weak var owner: Owner? // An animal may or may not have an owner
//
//    init (name: String) {
//        print("Initializing: \(name)")
//        self.name = name
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//class Owner {
//    let name: String
//    weak var pet: Animal? // An owner may or may not have a pet
//
//    init (name: String) {
//        print("Initializing: \(name)")
//        self.name = name
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//var shiba: Animal?
//var mari: Owner?
//
//shiba = Animal(name: "Shibi")
//mari = Owner(name: "Mari")
//shiba!.owner = mari // Use the ! keyword to unwrap an optional value
//mari!.pet = shiba

//shiba = nil // Prints Deallocating: Shibi
//mari = nil // Deallocating: Mari

//********************************************
//
// Unowned Reference
//
//********************************************

//class Animal {
//    let name: String
//    // We use the unowned keyword to declare a variable
//    // or property as an unowned reference
//    unowned let owner: Owner // An animal must have an owner
//
//    init (name: String, owner: Owner) {
//        print("Initializing: \(name)")
//        self.name = name
//        self.owner = owner
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//class Owner {
//    let name: String
//    var pet: Animal? // An owner may or may not have a pet
//
//    init (name: String) {
//        print("Initializing: \(name)")
//        self.name = name
//    }
//
//    deinit {
//        print("Deallocating: \(self.name)")
//    }
//}
//
//var mari: Owner?
//mari = Owner(name: "Mari")
//mari!.pet = Animal(name: "Shibi", owner: mari!)

//mari = nil // Prints Deallocating: Mari, Deallocating: Shibi

