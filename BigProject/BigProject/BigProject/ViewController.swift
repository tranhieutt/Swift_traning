//
//  ViewController.swift
//  BigProject
//
//  Created by Tran Trung Hieu on 10/24/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit
import Alamofire




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let barCode = "823734014026"
         ServiceManager.sharedInstance.getInformationOfItemVia(barCode) { (list) -> Void in
            
            let listTest = list
            let product = listTest["product"]! as! NSDictionary
            let review = product["picture"] as! String
            let item = ItemReview.init()
            let originURL = "http://www.goodfoods.reviews/site_media"
            item.picture = originURL + review;
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}

