//
//  ChainningFunction.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation

class ChainingFunction {
    
    static func chaining(){
        let numbers = 1...10
        
        let sum = numbers.filter {
            $0 % 2 == 1 //select all the odd numbers
            }.map {
                $0 * $0 // square them
            }.reduce(0){$0 + $1} // get their sum
        
        print(sum)
        
    }
}
