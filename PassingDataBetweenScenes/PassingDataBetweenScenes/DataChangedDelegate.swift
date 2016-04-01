//
//  DataChangedDelegate.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

protocol DataChangedDelegate {

    func dataChanged(data: [String]) -> Void
    
}