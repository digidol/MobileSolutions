//
//  SessionItem.swift
//  DataStore-SQLite-part1-Swift
//
//  Created by Neil Taylor on 15/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

/**
 * The DataStore class will extract information from the database and 
 * create the appropriate SessionItem objects.
 */
class SessionItem {

    var id: String!
    var title: String!
    var content: String?
    var dayId: Int!
    var location: Location?
   
    init() {
    }
}
