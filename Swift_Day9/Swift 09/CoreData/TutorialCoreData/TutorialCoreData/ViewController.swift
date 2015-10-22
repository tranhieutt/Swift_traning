//
//  ViewController.swift
//  TutorialCoreData
//
//  Created by Bharat Nakum on 8/6/15.
//  Copyright © 2015 Bharat Nakum. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    
    @IBOutlet weak var tblView: UITableView!
    
    var names  = [String]()
    var cityNames = [NSManagedObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "City List"
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        fetchAllPeople()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBtnAddName(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New City", message: "Add a new city", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default)
                            {
                                (action : UIAlertAction!) -> Void in
                                
                                let textField = alert.textFields![0] as UITextField!
                                //self.names.append(textField.text!)
                                self.saveName(textField.text!)
                                self.tblView.reloadData()
                            }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default)
                           {
                                (action : UIAlertAction!) -> Void in
                           }
        
        alert.addTextFieldWithConfigurationHandler
                            {
                                (textField : UITextField!) -> Void in
                            }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name : String)
    {
        let appDelegate    = UIApplication.sharedApplication().delegate as? AppDelegate

        let managedContext = appDelegate!.managedObjectContext

        let entity         = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let person         = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        person.setValue(name, forKey:"name")
        
        do
        {
            try managedContext.save()
        }
        catch
        {
            print("There is some error.")
        }
        
        /*if cityNames .contains(person)
        {
            let theIndex = cityNames.indexOf(person) as Int!
            
            cityNames.replaceRange(theIndex...theIndex, with: [person])
        }
        else
        {*/
            cityNames.append(person)
        //}
        
    }
    
    func fetchAllPeople()
    {
        let appDelegate    = UIApplication.sharedApplication().delegate as! AppDelegate

        let managedContext = appDelegate.managedObjectContext

        let fetchRequest   = NSFetchRequest(entityName: "Person")
        
        do
        {
           let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
           if let results = fetchedResult
           {
              cityNames = results
           }
           else
           {
               print("Could not fetch result")
           }
        }
        catch
        {
            print("There is some error.")
        }
        
        self.tblView.reloadData()
    }
    
    func editName(name : String, andIndex theIndex : Int)
    {
        let appDelegate    = UIApplication.sharedApplication().delegate as! AppDelegate

        let managedContext = appDelegate.managedObjectContext

        let fetchRequest   = NSFetchRequest(entityName: "Person")
        
        do
        {
            let fetchResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let theResult = fetchResult
            {
                let personToUpdate = theResult[theIndex] as NSManagedObject
                personToUpdate.setValue(name, forKey:"name")
                
                do
                {
                    try managedContext.save()
                }
                catch
                {
                    print("There is some error.")
                }
                
                if cityNames .contains(personToUpdate)
                {
                    cityNames.replaceRange(theIndex...theIndex, with: [personToUpdate])
                    self.tblView.reloadData()
                }
            }
        }
        catch
        {
            print("Some error in fetching queries.")
        }
    }
    
    func deleteName(atIndex : Int)
    {
        let appDelegate    = UIApplication.sharedApplication().delegate as! AppDelegate

        let managedContext = appDelegate.managedObjectContext

        let objectToRemove = cityNames[atIndex] as NSManagedObject
        
        managedContext.deleteObject(objectToRemove)
        
        do
        {
            try managedContext.save()
        }
        catch
        {
            print("There is some error while updating CoreData.")
        }
        
        cityNames.removeAtIndex(atIndex)
        
        self.tblView.reloadData()
    }
    
    func showEditNameAlert(atIndex theIndex : Int)
    {
        let person     = cityNames[theIndex]
        let nameToEdit = person.valueForKey("name") as? String
        
        let alert = UIAlertController(title: "Update City", message: "Edit a city", preferredStyle: .Alert)
        
        let updateAction = UIAlertAction(title: "Update", style: .Default)
                                        {
                                            (action : UIAlertAction!) -> Void in
                                            
                                            let textField = alert.textFields![0] as UITextField!
                                            
                                            if nameToEdit != textField.text
                                            {
                                                self.editName(textField.text!, andIndex: theIndex)
                                            }
                                        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default)
                                            {
                                                (action : UIAlertAction) -> Void in
                                            }
        
        alert.addTextFieldWithConfigurationHandler
                            {
                                (textField : UITextField!) -> Void in
                                textField.text = nameToEdit
                            }
        
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

extension ViewController : UITableViewDataSource
{
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        
        
        /*let theCell                      = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?

        if let theNewCell = theCell
        {
            theNewCell.textLabel!.textAlignment = .Center
        }*/
        
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        if editingStyle == .Delete
        {
            self.deleteName(indexPath.row)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cityNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let theCell              = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!

        tableView.separatorInset = UIEdgeInsetsZero
        
        let person              = cityNames[indexPath.row]
        theCell.textLabel!.text = person.valueForKey("name") as? String
        return theCell
    }
}

extension ViewController : UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.showEditNameAlert(atIndex: indexPath.row)
    }
}

