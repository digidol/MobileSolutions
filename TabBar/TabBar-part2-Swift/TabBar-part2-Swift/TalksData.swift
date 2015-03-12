//
//  Talks.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation

class TalksData {
    
    // Array of talks
    var talks: [Talk] = []
    
    // Dictionary of Venues
    var venues: [String: Venue] = [:]
    
    // Create a new instance and prepare the data
    init() {
        createVenues()
        createTalks()
    }
    
    // Create a set of talks, with speakers and venue
    func createTalks() {
        var talk = Talk(title: "Welcome", startTime: "10:00")
        talk.addSpeaker(Speaker(name: "Neil Taylor", organisation: "Aberystwyth University"))
        talk.addVenue(venues["Physics Main"]!)
        talks.append(talk)
        
        talk = Talk(title: "Apple Watch", startTime: "10:30")
        talk.addSpeaker(Speaker(name: "Tim Cook", organisation: "Apple, Inc."))
        talk.addVenue(venues["Physics Main"]!)
        talks.append(talk)
        
        talk = Talk(title: "Hello, Windows Phone", startTime: "11:00")
        talk.addSpeaker(Speaker(name: "Bill Gates", organisation: "Microsoft"))
        talk.addVenue(venues["Biology Main"]!)
        talks.append(talk)
    }
    
    // Create a set of venues 
    func createVenues() {
        venues["Physics Main"] = Venue(title: "Physics Main", latitude: 52.415902, longitude: -4.06583)
        venues["Biology Main"] = Venue(title: "Biology Main", latitude: 52.415713, longitude: -4.066304)
        
    }
}