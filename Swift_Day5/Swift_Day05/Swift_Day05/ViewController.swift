//
//  ViewController.swift
//  Swift_Day05
//
//  Created by Dang Thai Son on 9/28/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let exString: String = "123456789"
        print("Using original function: \(exString.characters.count)")
        print("Use String Extension: \(exString.length)")
        
        // Substirng Extension
        print("Substring \(exString.subString(1, length: 5))")
        
        // Replace String
        let newString = exString.replace("123", withString: "111")
        print("Repacled String: \(newString)")
        
        // Implement Spellcheck :D
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

