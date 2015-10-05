//: Playground - noun: a place where people can play

import UIKit

let fileManager = NSFileManager()
let urls = fileManager.URLsForDirectory(
    NSSearchPathDirectory.DocumentDirectory,
    inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
if urls.count > 0{
    let documentsFolder = urls[0]
    print("\(documentsFolder)")
}else{
    print("Could not find the Documents folder")
}

