//
//  page1Controller.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import WatchKit
import Foundation

class page1Controller: WKInterfaceController {
    @IBOutlet weak var page1: WKInterfaceLabel!
    func displayDataPage1() {
        //initialize array
        let memory1=["text":"apple"]
        let memory2=["text":"banana"]
        
        var memoryArray:[Dictionary<String, String>]=[]
        memoryArray+=[memory1]
        memoryArray+=[memory2]
        
        self.page1.setText(memoryArray[1]["text"])
        
    }


}