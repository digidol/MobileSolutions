//
//  Location.swift
//  DataStore-SQLite-part1-Swift
//
//  Created by Neil Taylor on 15/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation

/**
* The DataStore class will extract information from the database and
* create the appropriate SessionItem objects.
*/
class Location {

    var id: String!
    var title: String!
    var latitude: Double!
    var longitude: Double!
    
    init() {
    }
}