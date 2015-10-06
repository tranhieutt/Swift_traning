//
//  ViewController.swift
//  SwiftDay7_DemoStoryboard
//
//  Created by TranDuy on 10/3/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yourName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SecondViewController" {
            if let secondVC = segue.destinationViewController as? SecondViewController {
                secondVC.yourName = yourName.text!
            }
        }
    }
}

