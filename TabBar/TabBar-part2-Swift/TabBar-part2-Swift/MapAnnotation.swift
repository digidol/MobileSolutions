//
//  MapAnnotation.swift
//  TabBar-part2-Swift
//
//  Created by Neil Taylor on 12/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2DMake(0, 0)
    
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        super.init()
        self.coordinate = coordinate
        self.title = title
    }

}