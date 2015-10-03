//: Playground - noun: a place where people can play

import UIKit

// OOP
class Animal {
    var name: String?
    var size: Double?
}
class Bird: Animal {
    var legs = 2
    var wings = 2
}
class Reptile: Animal {
    var favoriteTemperature = 37.0
}
class Crocodile: Reptile {
    var legs = 4
}

class Mammal: Animal {
    var legs = 4
}
//class Dog: Mammal {
//    
//}

func walk(animal: Animal) {
    if let a = animal as? Bird {
        print("walking an animal with \(a.legs) legs")
    } else if let a = animal as? Crocodile {
        print("walking an animal with \(a.legs) legs")
    }
//    else if let a = animal as? Mammal {
//        print("walking an animal with \(a.legs) legs")
//    }
    
    // ERROR: if we add new animal with legs we will need to add a new section to our if-statement.
}

var aBird: Bird = Bird()
var aMammal: Mammal = Mammal()

walk(aBird)
walk(aMammal)




// Protocol-Oriented
protocol LeggedAnimal {
    var legs: Int { get set }
}

class BetterBird: Animal, LeggedAnimal {
    var legs = 2
    var wings = 2
}

class BetterCrocodile: Reptile, LeggedAnimal {
    var legs = 4
}

func betterWalk(animal: LeggedAnimal) {
    print("walking an animal with \(animal.legs) legs")
}

var aReptile: Reptile?
var betterCroc:BetterCrocodile = BetterCrocodile()
var betterBird: BetterBird = BetterBird()

betterWalk(betterCroc)
betterWalk(betterBird)
betterWalk(aReptile)
