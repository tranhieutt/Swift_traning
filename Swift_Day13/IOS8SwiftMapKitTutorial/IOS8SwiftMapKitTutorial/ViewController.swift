//
//  ViewController.swift
//  IOS8SwiftMapKitTutorial
//
//  Created by Arthur Knopper on 17/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
  @IBOutlet weak var mapView: MKMapView!
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let location = CLLocationCoordinate2D(
      latitude: 51.50007773,
      longitude: -0.1246402
    )
    
    let span = MKCoordinateSpanMake(0.05, 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
    
    mapView.setRegion(region, animated: true)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = "Big Ben"
    annotation.subtitle = "London"
    
    mapView.addAnnotation(annotation)
    
    //======
    let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
    let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
    let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
    let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
    let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
    
    mapView.addAnnotation(london)
    mapView.addAnnotation(oslo)
    mapView.addAnnotation(paris)
    mapView.addAnnotation(rome)
    mapView.addAnnotation(washington)
    mapView.mapType = MKMapType.Hybrid
    mapView.showsUserLocation = true
    
    
    
  }
       
    

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

