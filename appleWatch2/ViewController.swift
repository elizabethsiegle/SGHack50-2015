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
import AVFoundation
class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Singapore
        //println("???")
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MemoryData", ofType: "json")
        let content = NSData(contentsOfFile: path!)! as NSData
        
        //println(content) // prints the content of data.txt
        
        
        let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        var location = CLLocationCoordinate2D(latitude: 1.3000, longitude: 103.8000)
        
        var span = MKCoordinateSpanMake(0.25, 0.25)
        var region=MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)

        let jsonArray=json["result"] as! NSArray
        println("hi")
        
        for i in jsonArray{
            
            var location = CLLocationCoordinate2D(
                latitude: (i["lat"] as! NSString).doubleValue,
                longitude: (i["lng"] as! NSString).doubleValue
            )
            var annotation = MKPointAnnotation()
            println(location.latitude)
            annotation.coordinate = location
            annotation.title = i["title"] as! String
            annotation.subtitle=i["link"] as! String
            mapView.addAnnotation(annotation)
            AudioServicesPlaySystemSound(1005);
        }
    }
    

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

