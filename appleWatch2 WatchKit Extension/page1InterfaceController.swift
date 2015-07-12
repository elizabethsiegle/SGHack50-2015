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
        let defaults = NSUserDefaults.standardUserDefaults()
        var imageURL=String()
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            
        }
        
        let url = NSURL(string: "http://www.singaporememory.sg/thumbnails/contentFiles/140167?size=2")
        let data = NSData(contentsOfURL: url!)
        page1Image.setImage(UIImage(data: data!))
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
