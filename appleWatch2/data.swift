//
//  data.swift
//  appleWatch2
//
//  Created by Elizabeth Siegle on 7/11/15.
//  Copyright (c) 2015 Elizabeth Siegle. All rights reserved.
//

import Foundation
import MapKit

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
        return pubDate
    }
}