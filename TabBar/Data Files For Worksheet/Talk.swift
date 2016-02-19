//
//  Talk.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation

class Talk {
    
    var title: String
    var speakers: [Speaker] = []
    var startTime: String

    init(title: String, startTime: String) {
        self.title = title
        self.startTime = startTime
    }
    
    func addSpeaker(speaker: Speaker) {
       speakers.append(speaker)
    }
    
}