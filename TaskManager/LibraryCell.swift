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
    
    
    
    func setup(task: Task) {
        
        titleLabel.text = task.title
        
        
        switch task.available {
        
        case .complete:
            dateLabel.isHidden = true
            
            availibilityView.backgroundColor = .green
           
        case .incomplete(let date):
            dateLabel.isHidden = false
            availibilityView.backgroundColor = .red
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            
        }
    
    }
}
