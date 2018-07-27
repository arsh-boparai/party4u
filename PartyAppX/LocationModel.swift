//
//  LocationModel.swift
//  party4upro
//
//  Created by Arshdeep Singh on 2018-07-16.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//

import UIKit

class LocationModel: NSObject {
    var name: String?
    var theme: String?
    var place: String?
    var priva: String?
    var eventdate: String?
    var list: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    
    
    init(name: String,theme: String, place: String, priva: String, eventdate: String, list: String) {
        self.name = name
        self.theme = theme
        self.place = place
        self.priva = priva
        self.eventdate = eventdate
        self.list = list
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name:\(name),Theme: \(theme), Place: \(place), Private: \(priva), Event Date: \(eventdate), List of Guests: \(list)"
        
    }
    
    
    
}
