//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func readMyFile( myFile: String ) throws {
    
    // I can't believe this method doesn't take an NSURL
    if !NSFileManager.defaultManager().fileExistsAtPath( myFile) {
        throw fileError.fileIsMissing
    }
    
    guard NSFileManager.defaultManager().fileExistsAtPath( myFile) else {
        throw fileError.fileIsMissing
    }
    
    // do stuff with the file, which we're assured exists
}

enum fileError: ErrorType {
    case fileIsMissing
    case fileIsBusy
    // other cases as needed
}


var fileString = "~/myfile" // tilde represents a user's home directory
fileString = fileString.stringByExpandingTildeInPath

do {
    try readMyFile( fileString )
}
    
catch fileError.fileIsMissing {
    // handle the error appropriately
}
    
catch fileError.fileIsBusy {
    // different handling here
}