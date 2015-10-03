//
//  DemoExtension.swift
//  Swift_Day05
//
//  Created by Dang Thai Son on 9/28/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import Foundation


extension String {
     var length: Int {
        get {
            return self.characters.count
        }
    }
    
    func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func contains(s: String) -> Bool {
        return (self.rangeOfString(s) != nil) ? true : false
    }
    
    func subString(startIndex: Int, length: Int) -> String {
        let start = self.startIndex.advancedBy(startIndex)
        let end = self.startIndex.advancedBy(startIndex + length)
        return self.substringWithRange(Range<String.Index>(start: start, end: end))
    }
}