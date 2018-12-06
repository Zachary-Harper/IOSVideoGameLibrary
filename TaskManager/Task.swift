//
//  Game.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/29/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit



class Task {
    
    
    
    
    enum Availability {
        case complete
        case incomplete(dueDate: Date)
    }
     let title: String
     let description : String
     var available : Availability
    
    init(title: String, description: String) {
        self.title = title
        self.available = .complete
        self.description = description
        
    }
    
    
}
