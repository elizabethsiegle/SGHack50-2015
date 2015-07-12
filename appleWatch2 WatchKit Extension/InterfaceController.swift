//
//  InterfaceController.swift
//  appleWatch2 WatchKit Extension
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation

let userLocation=[1.326, 103.72]

class InterfaceController: WKInterfaceController {


    
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

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MemoryData", ofType: "json")
        let content = NSData(contentsOfFile: path!)! as NSData
        
        //println(content) // prints the content of data.txt
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
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
        //defaults.setObject(memoryArray, forKey: "memoryArray")
        

}

    @IBOutlet weak var slider: WKInterfaceSlider!
    //@IBOutlet weak var picker: WKInterfacePicker!
    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.titleLabel.setText("hi")
//        let bundle = NSBundle.mainBundle()
//        let path = bundle.pathForResource("MemoryData", ofType: "json")
//        let content = NSData(contentsOfFile: path!)! as NSData
//        
//        println(content) // prints the content of data.txt
        
//        let defaults = NSUserDefaults.standardUserDefaults()
//        
//        let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
//        defaults.setObject(json, forKey: "json")
//        
//        var memoryArray=json["result"] as! NSArray
//        
//        var locationOfMemories:[[Double]]=[]
//        var idx=0.0
//        for i in memoryArray{
//            //println(i)
//            locationOfMemories.append([(i["lat"] as! NSString).doubleValue, (i["lng"] as! NSString).doubleValue, idx])
//            //print(i["lat"] as! String+" ")
//            //println(i["lng"] as! String)
//            idx+=1
//        }
//        
//        locationOfMemories.sort(sorterForDistance)
//        defaults.setObject(locationOfMemories, forKey: "locationOfMemories")
//        defaults.setObject(memoryArray, forKey: "memoryArray")
        
        
        
    }
    
       

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
