//: Playground - noun: a place where people can play

import UIKit

// MARK: - Base protocols
protocol Animal {
    var name: String { get set }
    var weight: Double { get set }
}

protocol Mammal: Animal {
    var minimumCountOfChildren: Int { get set }
}

protocol Insect: Animal {
    var feetPair: Int { get set }
}

protocol Canid: Mammal {
    func bark()
    func play()
}

protocol Pet {
    func play()
}

// MARK: - Example value types
struct Dog: Canid, Pet {
    // MARK: - Animal
    var name: String
    var weight: Double
    
    // MARK: - Mammal
    var minimumCountOfChildren: Int
    
    func play() {
        print("Dog's playing...")
    }
    
    func bark() {
        print("Bark!")
    }
}

struct Elephant: Mammal {
    // MARK: - Animal
    var name: String
    var weight: Double
    
    // MARK: - Mammal
    var minimumCountOfChildren: Int
}

struct Ant: Insect {
    // MARK: - Animal
    var name: String
    var weight: Double
    
    // MARK: - Insect
    var feetPair: Int
}


// MARK: - Zoo stuff
// [1]
struct Zoo<T> {
    private var entities = [T]()
    
    // [2]
    subscript(index: Int) -> T {
        set {
            entities += [newValue]
        }
        
        get {
            return entities[index]
        }
    }
    
    // [3]
    mutating func append(object: T)  {
        entities += [object]
    }
    
    var count: Int {
        return entities.count
    }
    
    /**
    Returns all animals.
    */
    func all() -> [T] {
        return entities
    }
    
    /**
    Returns all given types' values.
    */
    func allTypes<U>() -> [U] {
        // [4]
        return entities.filter { $0 is U }.map { $0 as! U }
    }
}


// MARK: - Playground
var zoo = Zoo<Animal>()

let dog = Dog(name: "Dog", weight: 20, minimumCountOfChildren: 1)
let elephant = Elephant(name: "Elephant", weight: 10000, minimumCountOfChildren: 1)
let ant = Ant(name: "Ant", weight: 0.03, feetPair: 4)

zoo.append(dog)
zoo.append(elephant)
zoo.append(ant)

let allDogs = zoo.allTypes() as [Dog]
let all = zoo.allTypes() as [Animal] // But better is to use `zoo.all()`
