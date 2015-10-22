//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by TUYENBQ on 10/20/15.
//  Copyright © 2015 TUYENBQ. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var databasePath = NSString()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDB()
        insertDB()
        querySelect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDB(){
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0]
        
        databasePath = docsDir.stringByAppendingString(
            "/contacts.db")
        
        if !filemgr.fileExistsAtPath(databasePath as String) {
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB == nil {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            if contactDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }
    
    func insertDB(){
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('ABC', 'Ton That Thuyet', '01234567')"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                print("Error: \(contactDB.lastErrorMessage())")
            } else {
                print("Inserting is successed.")
            }
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    func querySelect(){
        let contactDB = FMDatabase(path: databasePath as String)
        if contactDB.open() {
            let querySQL = "SELECT * FROM CONTACTS"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            if results?.next() == true {
                print(results?.stringForColumn("address"))
                print(results?.stringForColumn("phone"))
            } else {
                print("Not found")
            }
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }


}

