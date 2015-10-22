//
//  ViewController.swift
//  Swift_Day09
//
//  Created by TUYENBQ on 10/18/15.
//  Copyright © 2015 TUYENBQ. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var company_ = [NSManagedObject]()
    @IBOutlet weak var myTableview: UITableView!
    let cellIdentifier = "cellIdentifier"
    let myArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableview.delegate = self;
        myTableview.dataSource = self;
        
        
        for index in 1...8 {
            let _string = "You will be number \(String(index)) lucky man today"
            myArray.addObject(_string)
            //print(myIndex)
        }
        
//        self.navigationItem.leftBarButtonItem?.enabled = false
//        for _ in 1...10{
//        insertToDB()
//        }
//        fetchAllCompany()
    }
    @IBAction func editBarButtonItemClicked(sender: AnyObject) {
//        myTableview.setEditing(true, animated: true)
//        self.navigationItem.leftBarButtonItem?.enabled = true
    }

    @IBAction func cancelBarButtonItemClicked(sender: AnyObject) {
//        myTableview.setEditing(false, animated: true)
//        self.navigationItem.leftBarButtonItem?.enabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // - MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier);
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        cell?.textLabel?.text = myArray.objectAtIndex(indexPath.row) as? String
        cell?.detailTextLabel?.text = "F*ck bitch!"
        return cell!;
    }
    
    // - MARK: UITableViewDataDelegate
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if(indexPath.row % 2 == 0){
//            print("This's my way!");
//        }
//        let cellSelected = tableView.cellForRowAtIndexPath(indexPath)
//        cellSelected?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        
//    }
//    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    
//    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        let itemToMove = myArray[fromIndexPath.row]
//        myArray.removeObjectAtIndex(fromIndexPath.row)
//        myArray.insertObject(itemToMove, atIndex: toIndexPath.row)
//    }
//    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.beginUpdates()
//        if (editingStyle == UITableViewCellEditingStyle.Delete) {
//            myArray .removeObjectAtIndex(indexPath.row)
//            tableView .deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
//        }
//        tableView.endUpdates()
//    }
    
    // - MARK: Core Data
//    func insertToDB(){
//        
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        let entity =  NSEntityDescription.entityForName("Company",
//            inManagedObjectContext:managedContext)
//        let company = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: managedContext) as? Company
//        company?.company_id = "3Si_12345"
//        company?.company_name = "3Si company"
//        company?.company_address = "Ton That Thuyet"
//        
//        do {
//            try managedContext.save()
//            company_.append(company!)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//        
//    }
//    
//    func fetchAllCompany(){
//        let appDelegate    = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        let fetchRequest   = NSFetchRequest(entityName: "Company")
//        
//        do
//        {
//            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
//            
//            if let results = fetchedResult
//            {
//                company_ = results
//                for index in 0..<company_.count{
//                    let comObj = company_[index] as? Company
//                    if let comObj_nonOptional = comObj!.company_address{
//                        print("company:\(comObj_nonOptional)")
//                        
//                    }
//                }
//            }
//            else
//            {
//                print("Could not fetch result")
//            }
//        }
//        catch
//        {
//            print("There is some error.")
//        }
//    }

}

