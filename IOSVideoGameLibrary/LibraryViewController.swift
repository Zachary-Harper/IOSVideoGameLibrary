//
//  LibraryViewController.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/29/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

import DZNEmptyDataSet

class LibraryViewController : UIViewController ,DZNEmptyDataSetDelegate, DZNEmptyDataSetSource{
    
    

   
    
    @IBOutlet weak var tableView: UITableView!
    

    
   

    let library = Library.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        library.games.append(Game(
            title: "Red Dead Redemption",
            genre: .action,
            description: "10/10 Metacritic, 2018",
            rating: .mature))
        
        library.games.append(Game(
            title: "Minecraft",
            genre: .action,
            description: "Is only game",
            rating: .everyone))
        library.games.append(Game(
            title: "Dolphin Olympics II",
            genre: .coolMath,
            description: "A game with dolphins. What else do you need",
            rating: .everyone))
        
        tableView.reloadData()
        
        self.tableView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tableView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        
        
        
        
        
    }
    
   }


extension LibraryViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        let game = library.games[indexPath.row]
        
        cell.setup(game: game)
        
        cell.textLabel?.text = library.games[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
    
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.available = .checkedOut(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.available = .checkedIn
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    
    
    }
extension LibraryViewController {
    func title(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "Empty Library"
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "You do not have any games to your library."
        
        var paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.paragraphStyle: paragraph]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView?, for state: UIControl.State) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        
        return NSAttributedString(string: "Add Game", attributes: attributes)
    }

    func emptyDataSet(_ scrollView: UIScrollView?, didTap button: UIButton?) {
        performSegue(withIdentifier: "LibraryToAddGame", sender: self)
        
        
    }

}


