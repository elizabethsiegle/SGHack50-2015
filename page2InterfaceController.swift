//
//  page1InterfaceController.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation


class page2InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var page2Label: WKInterfaceLabel!

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let defaults = NSUserDefaults.standardUserDefaults()
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            let closestMemoryIndex=Int(locationOfMemories[0][2])
            self.page2Label.setText(jsonArray[closestMemoryIndex]["description"] as! String)
        }

    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
