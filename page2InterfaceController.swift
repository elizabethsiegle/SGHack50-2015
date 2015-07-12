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
        let defaults = NSUserDefaults.standardUserDefaults()
        if let temp = defaults.dictionaryForKey("userNameKey")
        {
            let jsonArray=temp["result"] as! NSArray
            let closestMemory=defaults.integerForKey("closestMemory")
            //self.page2Label.setText(jsonArray[closestMemory]["description"] as! String)
        }
        
        
        // Configure interface objects here.
    }

    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //initialize array


    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}