//
//  Talk.swift
//  DataStore-CoreData-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation
import CoreData

class Talk: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var abstract: String
    @NSManaged var speaker: NSSet

}
