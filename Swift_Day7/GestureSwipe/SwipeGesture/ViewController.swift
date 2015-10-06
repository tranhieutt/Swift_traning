//
//  ViewController.swift
//  SwipeGesture
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
    
    
    @IBOutlet weak var image2: UIImageView!
    
    
    override func viewDidLoad() {
        
        
        var swipeGestureRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        image2.addGestureRecognizer(swipeGestureRight)
        
        var swipeGestureDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureDown.direction = UISwipeGestureRecognizerDirection.Down
        image2.addGestureRecognizer(swipeGestureDown)
        
        var swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        image2.addGestureRecognizer(swipeGestureLeft)
        
        var swipeGestureUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeGestureUp.direction = UISwipeGestureRecognizerDirection.Up
        image2.addGestureRecognizer(swipeGestureUp)
        
        
        super.viewDidLoad()
        
        image2.image = UIImage(named: "apple.png")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func respondToSwipeGesture(send: UIGestureRecognizer) {
        
        if let swipeGesture = send as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                changeImage()
                println("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                changeImage()
                println("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                changeImage()
                println("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                changeImage()
                println("Swiped up")
            default:
                break
            }
        }
    }
    
    func changeImage(){
        if (image2.image == UIImage(named: "apple.png")){
            image2.image = UIImage(named: "image1.png")}
        else{
            image2.image = UIImage(named: "apple.png")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


