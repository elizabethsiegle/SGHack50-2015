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
