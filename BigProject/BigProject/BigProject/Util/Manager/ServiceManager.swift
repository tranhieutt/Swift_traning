//
//  ServiceManager.swift
//  BigProject
//
//  Created by Tran Trung Hieu on 11/14/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import Foundation
import Alamofire


public class ServiceManager {
    class var sharedInstance: ServiceManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ServiceManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ServiceManager()
        }
        return Static.instance!
    }
    public func getReview(){
        let manager = Alamofire.Manager.sharedInstance
        let urlString = "https://goodfoods-search-grocery-product-reviews-by-barcode-v1.p.mashape.com/search?barcode=823734014026"
        let headers = ["Accept": "application/json","X-Mashape-Key": "tKxQHTDGAbmsh3dKmcUkZOz0utf1p1ZyJ4OjsnDxjp0ybJQGxP"]
        manager.request(.GET, urlString, headers: headers).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }

    }
    public  func getInformationOfItemVia(barCodeString: String, completion: ((list : NSDictionary!) -> Void)?) {
        //---  block code.
        let test = barCodeString;
        let manager = Alamofire.Manager.sharedInstance
        let urlString = "https://goodfoods-search-grocery-product-reviews-by-barcode-v1.p.mashape.com/search?barcode=" + test
        let headers = ["Accept": "application/json","X-Mashape-Key": "tKxQHTDGAbmsh3dKmcUkZOz0utf1p1ZyJ4OjsnDxjp0ybJQGxP"]
        manager.request(.GET, urlString, headers: headers).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
//                print("\(JSON)")
               
                if completion != nil {
                    completion! (list: JSON as! NSDictionary)
                }

            }
        }

    }


}

