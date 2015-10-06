//
//  ViewController.swift
//  Gestures
//
//  Created by Carlos Butron on 01/12/14.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//  License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
//  version.
//  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
//  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//  You should have received a copy of the GNU General Public License along with this program. If not, see
//  http:/www.gnu.org/licenses/.
//

import UIKit

class ViewController: UIViewController {
    
    
    var netRotation:CGFloat = 0
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        
        //ROTATION
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: "rotateGesture:")
        image.addGestureRecognizer(rotateGesture)
        
        
        
        //SWIPE
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        image.addGestureRecognizer(swipeGestureRight)
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureDown.direction = UISwipeGestureRecognizerDirection.Down
        image.addGestureRecognizer(swipeGestureDown)
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        image.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureUp.direction = UISwipeGestureRecognizerDirection.Up
        image.addGestureRecognizer(swipeGestureUp)
        
        
        
        //LONG PRESS
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPressGesture.minimumPressDuration = 2.0;
        
        image.addGestureRecognizer(longPressGesture)
        
        
        
        super.viewDidLoad()
        image.image = UIImage(named: "image1.png")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ROTATION
    @IBAction func rotateGesture(sender : UIRotationGestureRecognizer) {
        let rotation:CGFloat = sender.rotation
        let transform:CGAffineTransform  =
        CGAffineTransformMakeRotation(rotation + netRotation)
        sender.view?.transform = transform
        if (sender.state == UIGestureRecognizerState.Ended){
            netRotation += rotation;
        }
    }
    
    
    //SWIPE
    @IBAction func respondToSwipeGesture(send: UIGestureRecognizer) {
        
        if let swipeGesture = send as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                changeImage()
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                changeImage()
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                changeImage()
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                changeImage()
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    //LONG PRESS
    @IBAction func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            
            let myAlertView = UIAlertView()
            
            myAlertView.title = "Alert"
            myAlertView.message = "Gesto Long Press"
            myAlertView.addButtonWithTitle("ok")
            
            myAlertView.show()
            
            
        }
        
        
        
    }
    
    func changeImage(){
        if (image.image == UIImage(named: "image1.png")){
            image.image = UIImage(named: "image2.png")}
        else{
            image.image = UIImage(named: "image1.png")
        }
    }
    
    
}

