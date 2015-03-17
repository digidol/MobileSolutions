//
//  DataStore_CoreData_part1_Swift.swift
//  DataStore-CoreData-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation
import CoreData

class Speaker: NSManagedObject {

    @NSManaged var biography: String
    @NSManaged var email: String
    @NSManaged var forename: String
    @NSManaged var surname: String
    @NSManaged var talks: NSSet

}
