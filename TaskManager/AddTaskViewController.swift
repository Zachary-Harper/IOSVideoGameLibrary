//
//  AddGameViewController.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/31/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//
 
import UIKit

class AddTaskViewController : UIViewController {
    
    let library = Library.sharedInstance
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    

    
    @IBAction func saveTaskButtonTappes(_ sender: Any) {
        
        trySavingTask()
        
    }
    
    @IBAction func unwindToTaskManagerTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToTaskManager", sender: self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    func trySavingTask() {
        
        //title
        guard let title1: String = titleTextField.text else { return }
        
        //description
        guard let description2: String = descriptionTextView.text else { return }
        
        
        

        library.tasks.append(Task(title: title1, description: description2))
        
}
    
}
