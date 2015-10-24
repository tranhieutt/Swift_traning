//
//  ViewController.swift
//  Swift_Day12_Document_NSFileManager
//
//  Created by Tran Trung Hieu on 10/5/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate  {


    @IBOutlet weak var resultOfFilePath: UILabel!
    @IBOutlet weak var resultOfFileContent: UITextView!
    @IBOutlet weak var contentFile: UITextField!
    
    @IBOutlet weak var fileName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentFile.delegate = self
        fileName.delegate    = self
        resultOfFileContent.delegate = self;
        resultOfFileContent.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
//        Create folder
//        let fileManager = NSFileManager()
//        let urls = fileManager.URLsForDirectory(
//            NSSearchPathDirectory.DocumentDirectory,
//            inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
//        if urls.count > 0{
//            let documentsFolder = urls[0]
//            print("\(documentsFolder)")
//        }else{
//            print("Could not find the Documents folder")
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveFile(sender: AnyObject) {
          contentFile.resignFirstResponder();
          fileName.resignFirstResponder();
        if (contentFile.text != nil && fileName.text != nil) {
            let tempFileName = fileName.text
            let tempFileContent = contentFile.text
//            use optional binding
            if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
                
                let path = dir.stringByAppendingPathComponent(tempFileName!);
                resultOfFilePath.text = path
                
                //writing
                do {
                    try tempFileContent!.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                }
                catch {
                    /* error handling here */}
                //reading
                do {
                    let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    resultOfFileContent.text = text2 as String
                    
                }
                catch {
                    /* error handling here*/}
            
        }
        
    }

    }
    

    @IBAction func pushToListFile(sender: AnyObject) {
        
       
        
        let vc = ListFileViewController(nibName: "ListFileViewController", bundle: nil)
        vc.numberOfFile = self.listFiles()
        navigationController?.pushViewController(vc, animated: true)

        
    }
    func listFiles() -> [String] {
        
        
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
        if dirs != nil {
            let dir = dirs![0]
            do {
                let fileList = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(dir)
                return fileList as [String]
            }catch {
                
            }
            
        }else{
            let fileList = [""]
            return fileList
        }
        let fileList = [""]
        return fileList
        
    }
}

