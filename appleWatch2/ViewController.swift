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

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
        }
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestAlwaysAuthorization()
        }
        
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

