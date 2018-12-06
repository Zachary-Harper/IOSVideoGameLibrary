//
//  LibraryViewController.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/29/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit



class LibraryViewController : UIViewController {
    
    

   
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToTaskManager(segue: UIStoryboardSegue) {
        
    }
   

    let library = Library.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        library.tasks.append(Task(title : "Do Homework", description: "You have Math Homework"))
        library.tasks.append(Task(title: "Take Out Trash", description: "Take out trash and take it to the curb."))
        
        
        tableView.reloadData()
        
        
        
        
        
    }
    
   }


extension LibraryViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        let task = library.tasks[indexPath.row]
        
        cell.setup(task: task)
        
        cell.titleLabel?.text = library.tasks[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
    
    func checkOut(at indexPath: IndexPath) {
        let task = self.library.tasks[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        task.available = .incomplete(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let task = self.library.tasks[indexPath.row]
        task.available = .complete
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    
    
    }



