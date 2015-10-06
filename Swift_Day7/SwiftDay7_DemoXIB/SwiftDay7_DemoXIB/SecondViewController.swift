//
//  SecondViewController.swift
//  SwiftDay7_DemoXIB
//
//  Created by TranDuy on 10/3/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var yourName = ""
    
    @IBOutlet weak var yourNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        yourNameLabel.text = "Hello \(yourName)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
