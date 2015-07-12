//
//  page1InterfaceController.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation


class page1InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var page1Label: WKInterfaceLabel!

    @IBOutlet weak var page1Image: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let defaults = NSUserDefaults.standardUserDefaults()
        var imageURL=""
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            var mediaArray=jsonArray[Int(locationOfMemories[0][2])]["media"] as! NSArray
            if mediaArray.count>0{
                imageURL=mediaArray[0]["url"] as! String
            }
        }
        if imageURL != ""{
            let url = NSURL(string: imageURL)
            let data = NSData(contentsOfURL: url!)
            page1Image.setImage(UIImage(data: data!))
        }// Configure interface objects here.
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
