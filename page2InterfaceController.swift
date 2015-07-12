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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBOutlet weak var page2Label: WKInterfaceLabel!
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //initialize array
        let memory1=["text":"apple"]
        let memory2=["text":"banana"]
        
        var memoryArray:[Dictionary<String, String>]=[]
        memoryArray+=[memory1]
        memoryArray+=[memory2]
        
//        var memory: String
//        for memory: String in memoryArray {
//            self.page2Label.setText(memoryArray[memory]["text"])
//        }
//        var largest = 0
//        for (kind)
//    }
//    
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}