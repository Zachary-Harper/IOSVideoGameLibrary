//
//  AddGameViewController.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/31/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//
 
import UIKit

class AddGameViewController : UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    @IBOutlet weak var ratingSegmentedControl: UISegmentedControl!
   
    
    let segments: [(title: String, rating: Game.Rating)] =
        [("K", .kids),
         ("E", .everyone),
         ("T", .teen),
         ("M", .mature),
         ("AO", .adultsOnly)]
    
    let genres: [(title: String, genre: Game.Genre)] =
        [("Action", .action),
         ("Arcade", .arcade),
         ("Cool Math Games", .coolMath),
         ("Puzzle", .puzzle),
         ("Role Playing Game", .rpg)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingSegmentedControl.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
            ratingSegmentedControl.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
    }
    
    
    func trySavingGame() {
        
        // title
        guard let title = titleTextField.text else { return }
        
        // details
        guard let details = descriptionTextView.text else { return }
        
        // rating
        let rating = segments[ratingSegmentedControl.selectedSegmentIndex].rating
        
        // genre
        let genre = genrePickerView.selectedRow
}
    
}


extension AddGameViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
    
    
}
