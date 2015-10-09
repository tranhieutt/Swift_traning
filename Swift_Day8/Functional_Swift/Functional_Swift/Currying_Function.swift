//
//  Currying_Function.swift
//  Functional_Swift
//
//  Created by Dang Thai Son on 10/8/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation
func log (level: Int)(@autoclosure name:() -> String)(@autoclosure message:() -> String) -> String {
    
}
//Logger.log(level: .Debug)(name: "SomeName")(message: "message")
// Prints "Debug: SomeName - message