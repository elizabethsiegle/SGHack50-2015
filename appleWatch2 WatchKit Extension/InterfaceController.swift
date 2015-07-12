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
        var locations:[[Double]]=[]
        for i in memoryArray{
            //println(i)
            locations.append([(i["lat"] as! NSString).doubleValue, (i["lat"] as! NSString).doubleValue])
            //print(i["lat"] as! String+" ")
            //println(i["lng"] as! String)
        }
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
