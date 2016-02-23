//
//  ImageData.swift
//  QuackCam
//
//  Created by Neil Taylor on 19/02/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

/** 
 * This is a standard data class. We want to be able to serialise this to file 
 * for the purposes of this app. As a custom object, we need to provide the  
 * code to do this. Firstly, we need to set the parent object to be NSObject and
 * to say that we implement the NSCoding interface.
 */
class ImageData: NSObject, NSCoding {
    
    var name: String
    
    var title: String
    
    var date: NSDate
    
    init(name: String, title: String, date: NSDate) {
        self.name = name
        self.title = title
        self.date = date
    }
    
    /**
     * This method is used as part of the NSCoding process for serialisation. 
     * This init function will be called when we want to re-create an 
     * instance of this class that has previously been stored via the encodeWithCoder
     * method. It retrieves the information and passes it to the init method 
     * to initialise the data.
     */
    required convenience init(coder decoder: NSCoder) {
        self.init(name: decoder.decodeObjectForKey("name") as! String,
            title: decoder.decodeObjectForKey("title") as! String,
            date: decoder.decodeObjectForKey("date") as! NSDate)
    }
    
    /**
     * This method is called to take the data from the object and put it 
     * into the serialised stream that is passed in via the NSCoder. 
     */
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.date, forKey: "date")
    }
}