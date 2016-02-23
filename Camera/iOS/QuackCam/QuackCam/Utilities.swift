//
//  Utilities.swift
//  QuackCam
//
//  Created by Neil Taylor on 18/02/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

func documentPathWithString(file: String) -> String {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0].stringByAppendingString(file)
}


func documentsDirectoryURLWithFileComponent(file: String) -> NSURL {
    return documentsDirectoryURL().URLByAppendingPathComponent(file)
}

func documentsDirectoryURL() -> NSURL {
    
    return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
}