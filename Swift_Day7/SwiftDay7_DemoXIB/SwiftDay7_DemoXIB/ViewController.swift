//
//  ViewController.swift
//  SwiftDay7_DemoXIB
//
//  Created by TranDuy on 10/3/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yourNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello world!"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSayHelloButtonClick(sender: AnyObject) {
        let secondVC = SecondViewController(nibName:"SecondViewController", bundle:nil)
        secondVC.yourName = yourNameTextField.text!
        self.navigationController!.pushViewController(secondVC, animated:true)
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
