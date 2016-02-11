//
//  ViewController.swift
//  Swift15_Demo
//
//  Created by TUYENBQ on 11/16/15.
//  Copyright © 2015 TUYENBQ. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    let imageURLString: String = "http://sohanews2.vcmedia.vn/k:2015/1146849336-ngoc-trinh2-1434084972486/ngoc-trinh-noi-gi-khi-thanh-co-co-boc-bi-bat-khan-cap.jpg"
    let imageURLString1 = "http://wallpaperfx.com/view_image/pirates-of-the-caribbean-characters-2560x1440-wallpaper-18337.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //downloadWithQueue()
        
        //downloadImageByNSURLConnection()
        
       // downloadImageByNSURLSession()
        
        //downloadImageByAlamofire()
        
    }
    
    private func downloadWithQueue()-> Void{
        myIndicator.hidden = false
        myIndicator.startAnimating()
        let backgroundQueue = NSOperationQueue()
        backgroundQueue.maxConcurrentOperationCount = 1
        backgroundQueue.addOperationWithBlock(){
            
            print("download Ngoc Trinh from background")
            let url:NSURL = NSURL.init(string:self.imageURLString1)!
            
            let data:NSData = NSData.init(contentsOfURL: url)!
            
            NSOperationQueue.mainQueue().addOperationWithBlock(){
                print("updated Ngoc Trinh from main thread")
                self.myImageView.image = UIImage.init(data: data)
                self.myIndicator.stopAnimating()
                self.myIndicator.hidden = true
            }
        }
    }
    
    private func downloadImageByNSURLConnection()-> Void{
        myIndicator.hidden = false
        myIndicator.startAnimating()
        let myRequest = NSURLRequest.init(URL: NSURL.init(string: imageURLString)!)
        NSURLConnection.sendAsynchronousRequest(myRequest, queue: NSOperationQueue.mainQueue()) { (responde:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
            
            
            guard let dataReceived = data else{
                print("cannot get data")
                return
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.myImageView.image = UIImage.init(data: dataReceived)
                self.myIndicator.stopAnimating()
                self.myIndicator.hidden = true
            })
            
        }
    }
    
    private func downloadImageByNSURLSession()-> Void{
        myIndicator.hidden = false
        myIndicator.startAnimating()
        let myRequest = NSURLRequest.init(URL: NSURL.init(string: imageURLString)!)
        NSURLSession.sharedSession().dataTaskWithRequest(myRequest) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            guard let dataReceived = data else{
                print("cannot get data")
                return
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.myImageView.image = UIImage.init(data: dataReceived)
                self.myIndicator.stopAnimating()
                self.myIndicator.hidden = true
            })
        }.resume()
    }
    
    private func downloadImageByAlamofire()-> Void{
        //myIndicator.startAnimating()
        let URL = NSURL(string: imageURLString)
        let placeholderImage = UIImage(named: "manchester-united-logo")!
        
        self.myImageView.af_setImageWithURL(URL!, placeholderImage: placeholderImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

