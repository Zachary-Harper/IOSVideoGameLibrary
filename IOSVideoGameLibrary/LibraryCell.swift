//
//  LibraryCell.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 11/1/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class LibraryCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var availibilityView: UIView!
    
    
    
    func setup(game : Game) {
        
        titleLabel.text = game.title
        
        genreLabel.text = game.genre.rawValue
        
        ratingLabel.text = game.rating.rawValue
        
        
        switch game.available {
        
        case .checkedIn:
            dateLabel.isHidden = true
            
            availibilityView.backgroundColor = .green
           
        case .checkedOut(let date):
            dateLabel.isHidden = false
            availibilityView.backgroundColor = .red
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            
        }
    
    }
}
