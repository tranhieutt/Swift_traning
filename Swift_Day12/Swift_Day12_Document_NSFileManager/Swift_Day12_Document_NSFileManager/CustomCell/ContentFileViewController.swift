//
//  ContentFileViewController.swift
//  Swift_Day12_Document_NSFileManager
//
//  Created by Tran Trung Hieu on 10/24/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit

class ContentFileViewController: UIViewController,UITextViewDelegate {

    var contentFileTextView:String?
    @IBOutlet weak var fileContentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fileContentTextView.text = contentFileTextView!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveFileToPlistAction(sender: UIButton) {
//NSBundle
        if let path = NSBundle.mainBundle().pathForResource("ListFile", ofType: "plist") {
//            let  myDict = NSDictionary(contentsOfFile: path)
            
            let dict: NSMutableDictionary? = [:]
            //saving values
            dict!.setObject("123", forKey: "key1")
            dict!.setObject("345", forKey: "key2")

            dict!.writeToFile(path, atomically:true)
            
            let resultDictionary = NSMutableDictionary(contentsOfFile: path)
            print("Saved GameData.plist file is --> \(resultDictionary?.description)")
        }
        
    }

// MARK: NSFileManager
    @IBAction func createFolderAction(sender: UIButton) {
//Step1: Creating an NSFileManager Instance
        let filemanager = NSFileManager.defaultManager()
//Step2: get path of Root document: Document
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        let destinationPath:String = documentsPath.stringByAppendingString("/Swift2.45")
        do {
//            create folder
            try filemanager.createDirectoryAtPath(destinationPath as String, withIntermediateDirectories: false, attributes: nil)
//            record file into new folder
            
             let path = destinationPath.stringByAppendingString("abc");
            
            let dict: NSMutableDictionary? = [:]
            //saving values
            dict!.setObject("123", forKey: "key1")
            dict!.setObject("345", forKey: "key2")
            
            dict!.writeToFile(path as String, atomically:true)
            
            offsetFile(path)
            
            
        } catch let error as NSError {
            print(error.localizedDescription);
        }
        
        
    }

    func checkFileExist (pathFile: String) {
        //    other function
        //    Check file exist
        let fileManager = NSFileManager.defaultManager()
        
        guard  fileManager.fileExistsAtPath(pathFile) else {
            print("file ko ton tai")
            return
        }
        let u = "hgg"
        do {
           try u.writeToFile(pathFile, atomically: true, encoding:NSUTF8StringEncoding )
        } catch {
            
        }
        
        
        
        
        if  fileManager.fileExistsAtPath(pathFile){
            
        } else {
            
        }
    }
    func moveFile (pathFile:String, toPath destionPathFile:String){
        let fileManager = NSFileManager.defaultManager()
        
        do {
        try fileManager.moveItemAtPath(pathFile, toPath: destionPathFile)
        } catch  {
            
        }
    }
    func copyFile(fileManager:NSFileManager, fromPath pathFile:String, toPath destionPathFile:String){
        
        
//        do {
//            try fileManager.contentsEqualAtPath(pathFile, andPath: destionPathFile)
//        } catch {
//            
//        }
        
        let test = fileManager.contentsEqualAtPath(pathFile, andPath: destionPathFile)
        print(test as Bool);

        
        do {
            try fileManager.copyItemAtPath(pathFile, toPath: destionPathFile)
        } catch  {
            
        }
        
        
    }
// MARK: NSFileHandle
//    NSFileHandle
    func fileHandle(filePath:String) {
        let file: NSFileHandle? = NSFileHandle(forReadingAtPath: filePath)
        
        if file == nil {
            
        } else {
            file?.closeFile()
        }
    }
    func offsetFile(pathFile: String){
        let file: NSFileHandle? = NSFileHandle(forReadingAtPath: pathFile)
        
        if file == nil {
            print("File open failed")
        } else {
            print("Offset = \(file?.offsetInFile)")
            file?.seekToEndOfFile()
            print("Offset = \(file?.offsetInFile)")
            file?.seekToFileOffset(30)
            print("Offset = \(file?.offsetInFile)")
            file?.closeFile()
        }
    }
    func readingFile(pathFile:String) {
        let file: NSFileHandle? = NSFileHandle(forReadingAtPath: pathFile)
        
        if file == nil {
            print("File open failed")
        } else {
            file?.seekToFileOffset(10)
            let databuffer = file?.readDataOfLength(5)
            print(databuffer)
            file?.closeFile()
        }
    }
    func writingData(pathFile:String){
        let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: pathFile)
        
        if file == nil {
            print("File open failed")
        } else {
            let data = ("black dog" as
                NSString).dataUsingEncoding(NSUTF8StringEncoding)
            file?.seekToFileOffset(10)
            file?.writeData(data!)
            file?.closeFile()
        }

    }
    // MARK: NSData
    func converNSData () {
        let str = "Hello";
        // String to NSData
//        let data = str.dataUsingEncoding(NSUTF8StringEncoding)
        
        // NSData to String
//        let out: String = String(data:data!, encoding:NSUTF8StringEncoding)!
//        print(out) // ==> Hello
//        
//        let aString = "http://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-xfp1/t31.0-8/q88/s720x720/10848858_907722502601079_2834541930671169073_o.jpg"
////        let url = NSURL(string: aString)
////        let data = NSData(contentsOfURL: url!)
////        Convert data to UIImage
        
        }
    

    @IBAction func testOtherFunction(sender: AnyObject) {
        converNSData()
    }
}
