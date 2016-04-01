//
//  SelectionItem.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import Foundation

// This represents an item that can be selected. It holds the actual data, 
// which is a simple string in this example, and the selected status 
// for the item. 
struct SelectionItem {
    
    var data: String?
    
    var selected = false
    
    init(data: String) {
       self.data = data
    }
    
    init(data: String, selected: Bool) {
        self.data = data
        self.selected = selected
    }
    
}
