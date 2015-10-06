//
//  ViewController.swift
//  RotateGesture
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
        let rotateGesture = UIRotationGestureRecognizer(target: self,
            action: "rotateGesture:")
        image.addGestureRecognizer(rotateGesture)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateGesture(sender : UIRotationGestureRecognizer) {
        let rotation:CGFloat = sender.rotation
        let transform:CGAffineTransform  =
        CGAffineTransformMakeRotation(rotation + netRotation)
        sender.view?.transform = transform
        if (sender.state == UIGestureRecognizerState.Ended){
            netRotation += rotation;
        }
    }
    
}


