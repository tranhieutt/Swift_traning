//: Playground - noun: a place where people can play

import UIKit

class PresentErrorViewController: UIViewController {
    var errorViewIsShowing: Bool = false
    func presentError(message: String = "Error!", withArrow shouldShowArrow: Bool = false, backgroundColor: UIColor = UIColor.redColor(), withSize size: CGSize = CGSizeZero, canDismissByTappingAnywhere canDismiss: Bool = true) {
        //do complicated, fragile logic
    }
}

//Over 100 classes inherited from this class, by the way.
class EveryViewControllerInApp: PresentErrorViewController {}



//protocol ErrorPopoverRenderer {
//    func presentError(message: String, withArrow shouldShowArrow: Bool, backgroundColor: UIColor, withSize size: CGSize, canDismissByTappingAnywhere canDismiss: Bool)
//}
//
//extension UIViewController: ErrorPopoverRenderer { //Make all the UIViewControllers that conform to ErrorPopoverRenderer have a default implementation of presentError
//    func presentError(message: String, withArrow shouldShowArrow: Bool, backgroundColor: UIColor, withSize size: CGSize, canDismissByTappingAnywhere canDismiss: Bool) {
//        //add default implementation of present error view
//    }
//}

//class KrakenViewController: UIViewController, ErrorPopoverRenderer { //Drop the God class and make KrakenViewController conform to the new ErrorPopoverRenderer Protocol.
//    func methodThatHasAnError() {
//        //…
//        //Throw error because the Kraken sucks at eating Humans today.
//        presentError(/*blah blah blah much parameters*/)
//    }
//}