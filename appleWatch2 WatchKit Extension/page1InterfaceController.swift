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
        
        self.page1Label.setText("ayyy")
        let url = NSURL(string: "http://www.singaporememory.sg/thumbnails/contentFiles/140167?size=2")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
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
