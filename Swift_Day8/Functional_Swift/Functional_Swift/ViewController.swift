//
//  ViewController.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/5/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animals = ["Cat", "Chicken", "fish", "Dog", "Mouse", "Guinea Pig", "monkey", "Cho", "donkey"]
        
        let animalArray = AdvanceReduce.buildIndexImperative(animals)
//        print(animalArray)
        // Array Filter Extension
//        let evens = Array(1...10).arrayFilter{ $0 % 2 == 0 }
//        print(evens)
        
        let carImp = CarImperative()
        let carDecl = CarDeclarative()
        
          print("** CarImperative **")
        carImp.race()
        
        typealias Time = Int
        typealias Positions = [Int]
        typealias State = (time: Time, positions: Positions)
        let state: State = (time: 5, positions: [1, 1, 1])
        print("\n")
        print("** CarDeclarative **")
        carDecl.race(state)
    }

}

func hello(name: String, age: Int, location: String) {
    print("Hello \(name). I live in \(location) too. When is your \(age + 1)th birthday?")
}

func functionReturnFunction(x: Int) -> (Int -> Int) -> String {
    
    func returnFunction(y: Int) -> Int -> String {
        print("\(y)")
        func functionReturnString (z: Int) -> String {
            return "Function return String"
        }
        return functionReturnString
    }

    func functionGetFunctionParam(functionParam: Int -> Int) -> String {
        return "Another Function return String"
    }
    
    return functionGetFunctionParam

    
//    return returnFunction
    
    
   //    return { number in
//        return x + number
//        
//    }
}

class MyHelloWorldClass {
    
    func helloWithName(name: String) -> String {
        return "hello, \(name)"
    }
}




