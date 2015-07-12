//
//  data.swift
//  
//
//  Created by Elizabeth Siegle on 7/11/15.
//
//

import Foundation
import MapKit
import AddressBook

class data: NSObject, MKAnnotation {
    let description1: String
    let pubDate: String
    let author: String
    let media: String
    let coordinate: CLLocationCoordinate2D
    
    init(description1: String, pubDate: String, author: String, media: String, coordinate: CLLocationCoordinate2D) {
        self.description1 = description1
        self.pubDate = pubDate
        self.author = author
        self.media = media
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String {
        return description1
    }
    
    // annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = description1
        
        return mapItem
    }
}