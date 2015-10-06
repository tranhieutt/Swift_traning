//
//  ViewController.swift
//  SwiftDay7_DemoFrameBound
//
//  Created by TranDuy on 10/4/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    // Labels
    @IBOutlet weak var frameX: UILabel!
    @IBOutlet weak var frameY: UILabel!
    @IBOutlet weak var frameWidth: UILabel!
    @IBOutlet weak var frameHeight: UILabel!
    @IBOutlet weak var boundsX: UILabel!
    @IBOutlet weak var boundsY: UILabel!
    @IBOutlet weak var boundsWidth: UILabel!
    @IBOutlet weak var boundsHeight: UILabel!
    @IBOutlet weak var centerX: UILabel!
    @IBOutlet weak var centerY: UILabel!
    @IBOutlet weak var rotation: UILabel!
    
    // Sliders
    @IBOutlet weak var frameXSlider: UISlider!
    @IBOutlet weak var frameYSlider: UISlider!
    @IBOutlet weak var frameWidthSlider: UISlider!
    @IBOutlet weak var frameHeightSlider: UISlider!
    @IBOutlet weak var boundsXSlider: UISlider!
    @IBOutlet weak var boundsYSlider: UISlider!
    @IBOutlet weak var boundsWidthSlider: UISlider!
    @IBOutlet weak var boundsHeightSlider: UISlider!
    @IBOutlet weak var centerXSlider: UISlider!
    @IBOutlet weak var centerYSlider: UISlider!
    @IBOutlet weak var rotationSlider: UISlider!
    
    // Slider actions
    @IBAction func frameXSliderChanged(sender: AnyObject) {
        myView.frame.origin.x = CGFloat(frameXSlider.value)
        updateLabels()
    }
    @IBAction func frameYSliderChanged(sender: AnyObject) {
        myView.frame.origin.y = CGFloat(frameYSlider.value)
        updateLabels()
    }
    @IBAction func frameWidthSliderChanged(sender: AnyObject) {
        myView.frame.size.width = CGFloat(frameWidthSlider.value)
        updateLabels()
    }
    @IBAction func frameHeightSliderChanged(sender: AnyObject) {
        myView.frame.size.height = CGFloat(frameHeightSlider.value)
        updateLabels()
    }
    @IBAction func boundsXSliderChanged(sender: AnyObject) {
        myView.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateLabels()
    }
    @IBAction func boundsYSliderChanged(sender: AnyObject) {
        myView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateLabels()
    }
    @IBAction func boundsWidthSliderChanged(sender: AnyObject) {
        myView.bounds.size.width = CGFloat(boundsWidthSlider.value)
        updateLabels()
    }
    @IBAction func boundsHeightSliderChanged(sender: AnyObject) {
        myView.bounds.size.height = CGFloat(boundsHeightSlider.value)
        updateLabels()
    }
    @IBAction func centerXSliderChanged(sender: AnyObject) {
        myView.center.x = CGFloat(centerXSlider.value)
        updateLabels()
    }
    @IBAction func centerYSliderChanged(sender: AnyObject) {
        myView.center.y = CGFloat(centerYSlider.value)
        updateLabels()
    }
    @IBAction func rotationSliderChanged(sender: AnyObject) {
        let rotation = CGAffineTransformMakeRotation(CGFloat(rotationSlider.value))
        myView.transform = rotation
        updateLabels()
    }
    
    private func updateLabels() {
        
        frameX.text = "frame x = \(Int(myView.frame.origin.x))"
        frameY.text = "frame y = \(Int(myView.frame.origin.y))"
        frameWidth.text = "frame width = \(Int(myView.frame.width))"
        frameHeight.text = "frame height = \(Int(myView.frame.height))"
        boundsX.text = "bounds x = \(Int(myView.bounds.origin.x))"
        boundsY.text = "bounds y = \(Int(myView.bounds.origin.y))"
        boundsWidth.text = "bounds width = \(Int(myView.bounds.width))"
        boundsHeight.text = "bounds height = \(Int(myView.bounds.height))"
        centerX.text = "center x = \(Int(myView.center.x))"
        centerY.text = "center y = \(Int(myView.center.y))"
        rotation.text = "rotation = \((rotationSlider.value))"
        
        frameXSlider.value = Float(myView.frame.origin.x)
        frameYSlider.value = Float(myView.frame.origin.y)
        frameWidthSlider.value = Float(myView.frame.size.width)
        frameHeightSlider.value = Float(myView.frame.size.height)
        boundsXSlider.value = Float(myView.bounds.origin.x)
        boundsYSlider.value = Float(myView.bounds.origin.y)
        boundsWidthSlider.value = Float(myView.bounds.size.width)
        boundsHeightSlider.value = Float(myView.bounds.size.height)
        centerXSlider.value = Float(myView.center.x)
        centerYSlider.value = Float(myView.center.y)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

