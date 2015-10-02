//
//  ViewController.swift
//  Swift_pattern
//
//  Created by Tran Trung Hieu on 9/30/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
//        // Match only non-nil values
//        for case let number? in arrayOfOptionalInts {
//            print("Found a \(number)")
//        }
        func f() {
            defer { print("First") }
            defer { print("Second") }
            defer { print("Third") }
        }
        f()
        for i in 1...5 {
            print ("In \(i)")
            defer {
                print ("Deferred \(i)")
            }
            print ("Out \(i)")
        }

        class Animal {
            func bark() -> String {
                return "$&%#"
            }
        }
        
        class Dog: Animal {
            override func bark() -> String {
                return "woof-woof"
            }
        }
        
        let things: [Any] = [0, 0.87, Animal(), Dog()]
        
        for thing in things {
            switch thing {
                // thing is determined whether or Int. I use is when not interested in the value itself
            case is Int:
                print("thing is Int value")
            case is Double:
                print("thing is Double")
            case is Float:
                print("thing is Float")
                // Thing it is determined to match a Dog
                // (Or the right side of the type or its subtypes of as),
                // If there is a match, get a dog that has been cast on the Dog
            case let dog as Dog:
                print("Dog barks " + dog.bark())
            case let animal as Animal:
                print("Animal barks " + animal.bark())
            default:
                print("something else")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
class Pattern {
    
}

