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
        
        var location = CLLocationCoordinate2D(
            latitude: 1.3047139,
            longitude: 103.8745279
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Roatan"
        annotation.subtitle = "Honduras"
        
        mapView.addAnnotation(annotation)
    }
    
    
    
   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // set initial location in Singapore
//        mapView.delegate = self
//        let initialLocation = CLLocation(latitude: 1.3000, longitude: 103.8000)
//        
//        centerMapOnLocation(initialLocation)
//        
//        let data1 = data(description1: "This is a video of the bicycle kick by V Sundramoorthy for Singapore against Brunei in a Malaysia Cup tie in 1993. This is widely considered as the greatest goal ever scored at the National Stadium.",
//            pubDate: "Mon, 26 Mar 2012 18:11:06 +0800",
//            author: "Wee Pin wan",
//            media: "http://mstream.nlb.gov.sg:80/nlbvod/_definst_/SM/content/SMA-8e82/SMA-8e826aaa-d1ad-4fc5-a031-68820a2a700b/SMA-8e826aaa-d1ad-4fc5-a031-68820a2a700b-F1-preview.mp4/playlist.m3u8",
//            coordinate: CLLocationCoordinate2D(latitude: 1.3047139, longitude: 103.8745279))
//        
//        mapView.addAnnotation(data1)
//        
//    }
    
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

