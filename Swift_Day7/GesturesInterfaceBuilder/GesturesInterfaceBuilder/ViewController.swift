//
//  ViewController.swift
//  GesturesInterfaceBuilder
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
    
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //SWIPE
    @IBAction func respondToSwipeGesture(send: UIGestureRecognizer) {
        
        alert("Swipe")
        
    }
    
    
    //LONG PRESS
    @IBAction func action(gestureRecognizer:UIGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            alert("Long Press")
            
            
        }
        
    }
    
    
    func alert(myString: String){
        
        let myAlertView = UIAlertView()
        
        myAlertView.title = "Alert"
        myAlertView.message = myString
        myAlertView.addButtonWithTitle("OK")
        
        myAlertView.show()
        
    }
    
    
}



