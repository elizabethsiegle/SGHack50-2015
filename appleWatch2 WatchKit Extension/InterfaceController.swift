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
        let defaults = NSUserDefaults.standardUserDefaults()
        var dict=["a": "hello", "b": "bye"]
        defaults.setObject(dict, forKey: "userNameKey")
        // Configure interface objects here.
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
