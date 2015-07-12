//
//  ViewController.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Singapore
        let initialLocation = CLLocation(latitude: 1.3000, longitude: 103.8000)
        centerMapOnLocation(initialLocation)

//        let manager = CLLocationManager()
//        if CLLocationManager.locationServicesEnabled() {
//            manager.startUpdatingLocation()
//        }
//        if CLLocationManager.authorizationStatus() == .NotDetermined {
//            manager.requestAlwaysAuthorization()
//        }
        mapView.delegate = self
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager!, didVisit visit: CLVisit!) {
        if visit.departureDate.isEqualToDate(NSDate.distantFuture() as! NSDate) {
            // User has arrived, but not left, the location
            print("You are at: /latitude, /longitude")
        } else {
            // The visit is complete
            print("You are leaving: /latitude, /longitude")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

