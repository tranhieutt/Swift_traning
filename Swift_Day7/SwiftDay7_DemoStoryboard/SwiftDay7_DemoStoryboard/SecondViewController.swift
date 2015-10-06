//
//  SecondViewController.swift
//  SwiftDay7_DemoStoryboard
//
//  Created by TranDuy on 10/3/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var yourName: String = ""

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text? = "Hello \(yourName)"
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
