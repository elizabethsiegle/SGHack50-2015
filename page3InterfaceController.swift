//
//  page1InterfaceController.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation


class page3InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var page3Label: WKInterfaceLabel!
    
    @IBOutlet weak var page3Map: WKInterfaceMap!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let defaults = NSUserDefaults.standardUserDefaults()
        var location = CLLocationCoordinate2D(
            latitude: 1.35,
            longitude: 103.8
        )
        var span = MKCoordinateSpanMake(0.2, 0.2)
        var region = MKCoordinateRegion(center: location, span: span)
        self.page3Map.setRegion(region)
        
        
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            for i in locationOfMemories[0..<5]{
                let curIndex=Int(i[2])
                location = CLLocationCoordinate2D(
                    latitude: i[0],
                    longitude: i[1]
                )
                var annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = "Roatan"
                annotation.subtitle = "Honduras"
                println(location.latitude)
                self.page3Map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
            }

        }
        
       
        //self.page3Map.addAnnotatio
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
