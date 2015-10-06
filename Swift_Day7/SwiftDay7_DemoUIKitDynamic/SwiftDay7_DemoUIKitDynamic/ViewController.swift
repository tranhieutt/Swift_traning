//
//  ViewController.swift
//  SwiftDay7_DemoUIKitDynamic
//
//  Created by TranDuy on 10/4/15.
//  Copyright © 2015 KD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    var square: UIView!
    var snap: UISnapBehavior!
    override func viewDidLoad() {
        super.viewDidLoad()
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.collisionDelegate = self
        // add a boundary that has the same frame as the barrier
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        print("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.first
        snap = UISnapBehavior(item: square, snapToPoint: touch!.locationInView(view))
        animator.addBehavior(snap)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

