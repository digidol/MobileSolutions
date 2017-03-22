//
//  DataChangedDelegate.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

/*
 * A protocol is like a interface in Java. The protocol specifies
 * function signatures (name, parameters and return type) but not
 * the implementation. 
 *
 * A class conforms to this protocol by adding it to the class 
 * definition, as shown in the following code.  
 *
 *
 *     class AClass : ASuperclass, DataChangedDelegate { 
 *         // class definition 
 *
 *         func dataChanged(_ data: [String]) -> Void { 
 *             // some implementation
 *         }
 *     }
 * 
 * See Apple's page at https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html for further info.
 *
 *
 */
@objc protocol DataChangedDelegate {

    @objc optional func dataChanged(_ data: [String]) -> Void
    
}
