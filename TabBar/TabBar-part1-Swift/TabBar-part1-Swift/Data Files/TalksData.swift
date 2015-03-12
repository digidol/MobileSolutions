//
//  Talks.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation

class TalksData {
    
    var talks: [Talk] = []
    
    init() {
        
        var talk = Talk(title: "Welcome", startTime: "10:00")
        talk.addSpeaker(Speaker(name: "Neil Taylor", organisation: "Aberystwyth University"))
        talks.append(talk)
        
        talk = Talk(title: "Apple Watch", startTime: "10:30")
        talk.addSpeaker(Speaker(name: "Tim Cook", organisation: "Apple, Inc."))
        talks.append(talk)
        
        talk = Talk(title: "Hello, Windows Phone", startTime: "11:00")
        talk.addSpeaker(Speaker(name: "Bill Gates", organisation: "Microsoft"))
        talks.append(talk)
    }
}