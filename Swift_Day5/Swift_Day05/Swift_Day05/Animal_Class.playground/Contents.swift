//: Playground - noun: a place where people can play

import UIKit

// MARK: - Base classes
class Animal {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

class Mammal: Animal {
    var minimumNumberOfChildren: Int
    
    init(name: String, weight: Double, minimumNumberOfChildren: Int) {
        self.minimumNumberOfChildren = minimumNumberOfChildren
        super.init(name: name, weight: weight)
    }
}

class Insect: Animal {
    var feetPair: Int
    
    init(name: String, weight: Double, feetPair: Int) {
        self.feetPair = feetPair
        super.init(name: name, weight: weight)
    }
}

class Canid: Mammal {
    func bark() {
        print("Bark")
    }
    
    func play() {
        print("Canid's playing...")
    }
}

// MARK: - Sub classes
class Dog: Canid {
    
}

class Ant: Insect {
    
}

class Pet: Animal {
    func play() {
        print("Pet's playing...")
    }
}
/*
Multiple inheritance is not allowed.

How to determine which method is the right one?
*/
//class Dog: Canid, Pet {
//    
//}


// MARK: - Zoo stuff
class Zoo {
    private var animals = [Animal]()
    
    func addAnimal(animal: Animal) {
        animals += [animal]
    }
    
    func allAnimals() -> [Animal] {
        return animals
    }
    
    func allMammals() -> [Mammal] {
        // [1]
        return animals.filter { $0 is Mammal }.map { $0 as! Mammal }
    }
    
    func mammals<T: Mammal>() -> [T] {
        // [2]
        return animals.filter { $0 is T }.map { $0 as! T }
    }
}


// MARK: - Playground
let zoo = Zoo()
let dog = Dog(name: "Dog", weight: 15, minimumNumberOfChildren: 1)
let ant = Ant(name: "Ant", weight: 0.003, feetPair: 4)

zoo.addAnimal(dog)
zoo.addAnimal(ant)
