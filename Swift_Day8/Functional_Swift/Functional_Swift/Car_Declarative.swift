//
//  Car_Declarative.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation
class CarDeclarative {
    
    typealias Time = Int
    typealias Positions = [Int]
    typealias State = (time: Time, positions: Positions)
    
    let state: State = (time: 5, positions: [1, 1, 1])
    
    // Helpers
    func race(state: State) {
        draw(state)
        
        if(state.time > 1) {
            print("\n\n")
            race(runStepOfRace(state))
        }
    }
    
    func draw(state: State) {
        let outputs = state.positions.map { position in outputCar(position) }
        let result = outputs.reduce(""){ $0 + $1 }
        
        print (result)
    }
    
    func runStepOfRace(state: State) -> State {
        let newTime = state.time - 1
        let newPositions = moveCars(state.positions)
        
        return (newTime, newPositions)
    }
    
    func outputCar(carPosition: Int) -> String {
        let output = (0..<carPosition).map { _ in "-" }
        
        return output.reduce("", combine:{ $0 + $1 })
    }
    
    func moveCars(positions: [Int]) -> [Int] {
        return positions.map { position in (randomPositiveNumberUpTo(10) > 3) ? position + 1 : position }
    }
    func randomPositiveNumberUpTo(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
}
