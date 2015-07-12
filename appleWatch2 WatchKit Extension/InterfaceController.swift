//
//  InterfaceController.swift
//  appleWatch2 WatchKit Extension
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {

    func getDistance(lat1: Double, lng1: Double, lat2: Double, lng2: Double) -> Double{
        var R=6371.0
        var x=(lng2-lng1) * cos(0.5*(lat2+lat1))
        var y=lat2-lat1
        return R*sqrt(x*x + y*y)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MemoryData", ofType: "json")
        let content = NSData(contentsOfFile: path!)! as NSData
        
        //println(content) // prints the content of data.txt
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        defaults.setObject(json, forKey: "userNameKey")
        var memoryArray=json["result"] as! NSArray
        var locationOfMemories:[[Double]]=[]
        for i in memoryArray{
            //println(i)
            locationOfMemories.append([(i["lat"] as! NSString).doubleValue, (i["lng"] as! NSString).doubleValue])
            //print(i["lat"] as! String+" ")
            //println(i["lng"] as! String)
        }
        var userLocation=[1.35, 103.8]
        var minDistance=10000.0
        var closestMemory=0
        var cnt=0
        for location in locationOfMemories{
            var distance=getDistance(userLocation[0], lng1: userLocation[1], lat2:location[0], lng2:location[1])
            if distance < minDistance{
                minDistance=distance
                closestMemory=cnt
            }
            cnt++
        }
        defaults.setInteger(closestMemory, forKey: "closestMemory")
    }

    @IBOutlet weak var slider: WKInterfaceSlider!
    //@IBOutlet weak var picker: WKInterfacePicker!
    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.titleLabel.setText("hi")
    }
    
       

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
