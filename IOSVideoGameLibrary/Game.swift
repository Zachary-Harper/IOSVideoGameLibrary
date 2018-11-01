//
//  Game.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/29/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class Game {
    
    
    enum Genre : String {
        case rpg = "RPG"
        case action = "Action"
        case fps = "FPS"
        case arcade = "Arcade"
        case coolMath = "CoolMath"
        case puzzle = "Puzzle"
        
        var symbol : String {
            switch self {
            case .rpg : return "RPG"
            case .action: return "Action"
            case .fps : return "FPS"
            case .arcade: return "Arcade"
            case .coolMath: return "CoolMath"
            case .puzzle: return "Puzzle"
            }
        }
    }
    
    enum Rating : String{
        case everyone = "Everyone"
        case teen = "Teen"
        case mature = "Mature"
        case kids = "Kids"
        case adultsOnly = "Adults Only"
        
        var symbol: String {
            switch self {
            case .everyone: return "E"
            case .adultsOnly: return "AO"
            case .kids: return "K"
            case .teen: return "T"
            case .mature: return "M"
            }
        }
        
    }
    
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
    }
    let title: String
    let rating: Rating
    let genre: Genre
    let description : String
    let available : Availability
    
    init(title: String, genre: Genre, description: String, rating: Rating) {
        self.title = title
        self.available = .checkedIn
        self.description = description
        self.rating = rating
        self.genre = genre
        
    }
    
    
}
