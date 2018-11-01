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
        
        
        
        
    }
    
   }


extension LibraryViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        let game = library.games[indexPath.row ]
        
        cell.setup(game: game)
        
        cell.textLabel?.text = library.games[indexPath.row].title
        return cell
        
    }
    }
