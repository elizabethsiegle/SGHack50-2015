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
        
        // Configure interface objects here.
    }

    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
            }
    
    @IBOutlet weak var page1: WKInterfaceLabel!
    func displayDataPage1() {
        //initialize array
        let memory1=["text":"apple"]
        let memory2=["text":"banana"]
        
        var memoryArray:[Dictionary<String, String>]=[]
        memoryArray+=[memory1]
        memoryArray+=[memory2]
        
        self.titleLabel.setText(memoryArray[1]["text"])

    }
   

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
