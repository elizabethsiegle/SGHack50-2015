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

        // Configure interface objects here.
    }
    
    func getDistance(lat1: Double, lng1: Double, lat2: Double, lng2: Double) -> Double{
        var R=6371.0
        var x=(lng2-lng1) * cos(0.5*(lat2+lat1))
        var y=lat2-lat1
        var distance = R*sqrt(x*x + y*y)
        return distance
    }
    
    func sorterForDistance(this:[Double], that:[Double]) -> Bool {
        let thisDistance=getDistance(userLocation[0], lng1: userLocation[1], lat2: this[0], lng2: this[1])
        
        let thatDistance=getDistance(userLocation[0], lng1: userLocation[1], lat2: that[0], lng2: that[1])
        
        return thisDistance < thatDistance
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        println(userLocation)
        self.page3Map.removeAllAnnotations()
        let defaults = NSUserDefaults.standardUserDefaults()
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MemoryData", ofType: "json")
        let content = NSData(contentsOfFile: path!)! as NSData
        
        //println(content) // prints the content of data.txt
        
        
        let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        defaults.setObject(json, forKey: "json")
        
        var memoryArray=json["result"] as! NSArray
        
        var locationOfMemories:[[Double]]=[]
        var idx=0.0
        for i in memoryArray{
            //println(i)
            locationOfMemories.append([(i["lat"] as! NSString).doubleValue, (i["lng"] as! NSString).doubleValue, idx])
            //print(i["lat"] as! String+" ")
            //println(i["lng"] as! String)
            idx+=1
        }
        
        locationOfMemories.sort(sorterForDistance)
        defaults.setObject(locationOfMemories, forKey: "locationOfMemories")
        var location = CLLocationCoordinate2D(
            latitude: userLocation[0],
            longitude: userLocation[1]
        )
        var span = MKCoordinateSpanMake(0.2, 0.2)
        var region = MKCoordinateRegion(center: location, span: span)
        self.page3Map.setRegion(region)
        
        
        if let temp = defaults.dictionaryForKey("json")
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            if let temp = defaults.dictionaryForKey("json")
            {
                let jsonArray=temp["result"] as! NSArray
                var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
                let closestMemoryIndex=Int(locationOfMemories[0][2])
                //self.page3TWKInterfaceImage.setImage(jsonArray[closestMemoryIndex]["media"] as! String)
                
            }
            
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            for i in locationOfMemories[0..<4]{
                let curIndex=Int(i[2])
                location = CLLocationCoordinate2D(
                    latitude: i[0],
                    longitude: i[1]
                )
                var annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = "Roatan"
                annotation.subtitle = "Honduras"
                self.page3Map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Red)
            }
        }
        location = CLLocationCoordinate2D(
            latitude: userLocation[0],
            longitude: userLocation[1]
        )
        self.page3Map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Purple)

        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
}
