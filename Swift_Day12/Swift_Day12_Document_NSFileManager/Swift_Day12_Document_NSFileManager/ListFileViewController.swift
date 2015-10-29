//
//  ListFileViewController.swift
//  Swift_Day12_Document_NSFileManager
//
//  Created by Tran Trung Hieu on 10/24/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit

class ListFileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var numberOfFile:NSArray?
    
    @IBOutlet weak var ourTableView: UITableView!
    let textCellIdentifier = "CustomCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ourTableView.delegate = self
        ourTableView.dataSource = self
        let myNib = UINib.init(nibName: "SwiftCustomTableViewCell", bundle: nil)
        ourTableView.registerNib(myNib, forCellReuseIdentifier: textCellIdentifier)
        
        
    }
    
    // MARK: UITableView Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (numberOfFile!.count)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! SwiftCustomTableViewCell
        cell.fileNameCell.text = numberOfFile![indexPath.row] as? String
        return cell
    }
    // MARK: UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let contentDetail = ContentFileViewController(nibName: "ContentFileViewController", bundle: nil)
     

        let selectedItem = numberOfFile!.objectAtIndex(indexPath.row) as! String
        let itemId = selectedItem.componentsSeparatedByString("$%^")
        // add to self.selectedItems
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            
            let path = dir.stringByAppendingPathComponent(selectedItem);
            //reading
            do {
                let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                contentDetail.contentFileTextView = text2 as String
                navigationController?.pushViewController(contentDetail, animated: true)
                
                
            }
            catch {
                /* error handling here*/}
            
        }

        print( itemId);
    }
}
