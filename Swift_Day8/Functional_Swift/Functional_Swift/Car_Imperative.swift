//
//  Car_Imperative.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation

/// Imperative - Second attempt ///
class CarImperative {
    
    var time = 5
    var carPositions = [1, 1, 1]
    
    func race() {
        while(time > 0) {
            runStepOfRace()
            draw()
        }
    }
    
    // Helpers Function
    
    func runStepOfRace() -> () {
        time -= 1
        moveCars()
    }
    
    func draw() {
//        print("\n")
        
        for carPosition in carPositions {
            drawCar(carPosition)
        }
    }
    
    func moveCars() -> () {
        for index in 0..<carPositions.count {
            if(arc4random_uniform(3) == 1) {
                carPositions[index] += 1
            }
        }
    }
    
    func drawCar(carPosition: Int) -> () {
        for _ in 0..<carPosition {
            print("-")
        }
        
//        print("\n")
    }
    
    func randomPositiveNumberUpTo(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
}



