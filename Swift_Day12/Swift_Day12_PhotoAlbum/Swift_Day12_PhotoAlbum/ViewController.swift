//
//  ViewController.swift
//  Swift_Day12_PhotoAlbum
//
//  Created by Tran Trung Hieu on 10/24/15.
//  Copyright © 2015 3SI. All rights reserved.
//

import UIKit
import Photos
   let albumName = "App Folder1"
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var assetCollection: PHAssetCollection = PHAssetCollection()
    var photosAsset: PHFetchResult!
    var numberOfFile:NSArray?
    var timeGetPhoto:String?
    var arrayOfTiming: [String] = []
    
    @IBOutlet weak var ourTableView: UITableView!
    let textCellIdentifier = "CustomCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myNib = UINib.init(nibName: "SwiftCustomTableViewCell", bundle: nil)
        ourTableView.registerNib(myNib, forCellReuseIdentifier: textCellIdentifier)
        
        
        //Check if the folder exists, if not, create it
        let fetchOptions = PHFetchOptions()
//        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection:PHFetchResult = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        
        if let first_Obj:AnyObject = collection.firstObject{
            //found the album
//            self.albumFound = true
            self.assetCollection = first_Obj as! PHAssetCollection
        }else{
            //Album placeholder for the asset collection, used to reference collection in completion handler
            var albumPlaceholder:PHObjectPlaceholder!
            //create the folder
          
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(albumName)
                albumPlaceholder = request.placeholderForCreatedAssetCollection
                },
                completionHandler: {(success:Bool, error:NSError?)in
                    if(success){
                        print("Successfully created folder")

                        let collection = PHAssetCollection.fetchAssetCollectionsWithLocalIdentifiers([albumPlaceholder.localIdentifier], options: nil)
                        self.assetCollection = collection.firstObject as! PHAssetCollection
                    }else{
                        #if DEBUG
                             print("Error creating folder")
                        #endif
                       

                    }
            })
        }

    }
    override func viewWillAppear(animated: Bool) {
        

        
        //fetch the photos from collection
        self.navigationController?.hidesBarsOnTap = false   //!! Use optional chaining
        self.photosAsset = PHAsset.fetchAssetsInAssetCollection(self.assetCollection, options: nil)
        
        
        if let photoCnt = self.photosAsset?.count{
            if(photoCnt == 0){
//                self.noPhotosLabel.hidden = false
            }else{
//                self.noPhotosLabel.hidden = true
            }
        }
//        self.collectionView.reloadData()
        self.ourTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getPhotoFromPhotoAlbum(sender: UIBarButtonItem) {
        
        let date = NSDate();
        let dateFormatter = NSDateFormatter()
        //To prevent displaying either date or time, set the desired style to NoStyle.
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle //Set time style
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle //Set date style
        dateFormatter.timeZone = NSTimeZone()
        let localDate = dateFormatter.stringFromDate(date)
        timeGetPhoto = localDate ;
        arrayOfTiming.append(timeGetPhoto!)
        
        
        let picker : UIImagePickerController = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.PhotoLibrary)!
        picker.delegate = self
        picker.allowsEditing = false
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func getPhotoFromCamera(sender: UIBarButtonItem) {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            //load the camera interface
            let picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.delegate = self
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            //no camera available
            let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction)in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }

    //UIImagePickerControllerDelegate Methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        if let image: UIImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            
            //Implement if allowing user to edit the selected image
            //let editedImage = info.objectForKey("UIImagePickerControllerEditedImage") as UIImage
            
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0), {
                PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                    let createAssetRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
                    let assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
                    if let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection, assets: self.photosAsset) {
                        albumChangeRequest.addAssets([assetPlaceholder!])
                    }
                    }, completionHandler: {(success, error)in
                        dispatch_async(dispatch_get_main_queue(), {
                            NSLog("Adding Image to Library -> %@", (success ? "Sucess":"Error!"))
                            picker.dismissViewControllerAnimated(true, completion: nil)
                        })
                })
                
            })
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        if(self.photosAsset != nil){
            count = self.photosAsset.count
        }
        return count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! SwiftCustomTableViewCell
        //Modify the cell
        let asset: PHAsset = self.photosAsset[indexPath.item] as! PHAsset
        
        // Create options for retrieving image (Degrades quality if using .Fast)
        //        let imageOptions = PHImageRequestOptions()
        //        imageOptions.resizeMode = PHImageRequestOptionsResizeMode.Fast
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: CGSizeMake(cell.imagePhotoAlbumThumbnail.frame.width, cell.imagePhotoAlbumThumbnail.frame.height), contentMode: .AspectFill, options: nil, resultHandler: {(result, info)in
            if let image = result {
               cell.imagePhotoAlbumThumbnail.image = image
            }
        })
        


//        cell.fileNameCell.text = arrayOfTiming[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let contentDetail = ContentFileViewController(nibName: "ContentFileViewController", bundle: nil)
        contentDetail.index = indexPath.row
        contentDetail.photosAsset = self.photosAsset
        navigationController?.pushViewController(contentDetail, animated: true)

       
    }

}



