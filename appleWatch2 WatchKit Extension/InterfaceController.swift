//
//  InterfaceController.swift
//  appleWatch2 WatchKit Extension
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation

var userLocation=[1.283905, 103.853649]

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var latSliderLabel: WKInterfaceLabel!

    @IBAction func latSlider(value: Float) {
        self.latSliderLabel.setText(value.description)
        userLocation[0]=Double(value)
    }
    @IBOutlet weak var longSliderLabel: WKInterfaceLabel!

    @IBAction func longSlider(value: Float) {
        self.longSliderLabel.setText(value.description)
        userLocation[1]=Double(value)
    }

    
    
    
    


    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        //defaults.setObject(memoryArray, forKey: "memoryArray")
        

}

    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            let closestMemoryIndex=Int(locationOfMemories[0][2])

        }
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
