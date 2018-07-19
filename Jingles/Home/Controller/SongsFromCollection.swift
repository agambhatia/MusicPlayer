//
//  SongsFromCollection.swift
//  Jingles
//
//  Created by Mini31 on 04/07/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class SongsFromCollection: UITableViewController {
    var albumSlected: Int?
    var artistSelected: Int?
    var sourceSongs: [Song] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 67.0, 0.0)
        if albumSlected != nil {
            sourceSongs = LibraryManager.shared.album[albumSlected!].songs
            
        }
        else{
            sourceSongs = LibraryManager.shared.artist[artistSelected!].songs
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
                                   
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sourceSongs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsFromCollection", for: indexPath)
       
        cell.textLabel?.text = sourceSongs[indexPath.row].title
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.highlightedTextColor = UIColor.orange
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MusicPlayer.shared.play(song: sourceSongs[indexPath.row])
    }
   
}

