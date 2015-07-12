
import WatchKit
import Foundation


class page1InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var page1Image: WKInterfaceImage!
    
    @IBOutlet weak var page1Label: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }
    
    var imageView=UIImageView()
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        println(userLocation)
        page1Image.setImage(nil)
        let defaults = NSUserDefaults.standardUserDefaults()
        var imageURL=""
        if let temp = defaults.dictionaryForKey("json")
        {
            let jsonArray=temp["result"] as! NSArray
            var locationOfMemories=defaults.arrayForKey("locationOfMemories") as! [[Double]]
            var mediaArray=jsonArray[Int(locationOfMemories[0][2])]["media"] as! NSArray
            if mediaArray.count>0{
                imageURL=mediaArray[0]["thumbnail"] as! String
            }
        }
        
        if imageURL != ""{
            self.page1Label.setText("")
            println("ayy lmao")
            let url = NSURL(string: imageURL)
            let data = NSData(contentsOfURL: url!)
            page1Image.setImage(UIImage(data: data!))
        } else{
            self.page1Label.setText("No Image")
            page1Image.setImage(UIImage(named: "blackbox.jpg"))
        }
        // Configure interface objects here.
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()

    }

}
