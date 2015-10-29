//
//  ContentFileViewController.swift
//  Swift_Day12_Document_NSFileManager
//
//  Created by Tran Trung Hieu on 10/24/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit
import Photos

class ContentFileViewController: UIViewController {
    var assetCollection: PHAssetCollection!
    var photosAsset: PHFetchResult!
    var index: Int = 0
    
    @IBOutlet weak var imagePhotoView: UIImageView!
    var contentFileTextView:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.displayPhoto()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayPhoto(){
        // Set targetSize of image to iPhone screen size
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        let targetSize = CGSizeMake(screenSize.width, screenSize.height)
        
        let imageManager = PHImageManager.defaultManager()
        if let asset = self.photosAsset[self.index] as? PHAsset{
            imageManager.requestImageForAsset(asset, targetSize: targetSize, contentMode: .AspectFit, options: nil, resultHandler: {
                (result, info)->Void in
                self.imagePhotoView.image = result
           
                let data = self.convertImageToNSData(self.imagePhotoView.image!)
                self.convertNSDataToImage(data)
                // day data to server
//
            })
        }
    }
    
    
    
    func convertImageToNSData(imageView:UIImage) -> NSData{
        let imageData: NSData = UIImagePNGRepresentation(imageView)!
        // wrap print
        print(imageData)
        return imageData
    }
    func convertNSDataToImage(data:NSData){
        let image : UIImage = UIImage(data: data)!
        let imageView = UIImageView(image: image)
        print(imageView)
       
        
    }

}
