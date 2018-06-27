//
//  SearchViewController.swift
//  Jingles
//
//  Created by Mini31 on 20/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

typealias SearchItem = Song

class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate, UITableViewDataSource {
    
    var song: Song?
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    var searchActive: Bool = false {
        didSet {
            if !searchActive {
                filtered = []
            }
        }
    }
    
    var source: [SearchItem] = []
    var filtered: [SearchItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    
        searchBar.delegate = self
        
        source = LibraryManager.shared.songs
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.text = nil
        searchBar.endEditing(true)
    }
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = source.filter({ (searchedItems) -> Bool in
            return searchedItems.title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased().contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
        })
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchActive
        {
            return filtered.isEmpty ? 1 : filtered.count
        }
        else
        {
            return LibraryManager.shared.songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewController") else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.highlightedTextColor = UIColor.orange
        
        let text: String
        if searchActive {
            if filtered.isEmpty {
                text = "No Match Found"
                cell.isUserInteractionEnabled = false
                
            } else {
                text = filtered[indexPath.row].title
                cell.isUserInteractionEnabled = true
            }
        }
        else
        {
           text = source[indexPath.row].title
            cell.isUserInteractionEnabled = true
        }
        cell.textLabel?.text = text

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if searchActive {
            song = filtered[indexPath.row]
        }
        else
        {
            song = source[indexPath.row]
        }
       
      MusicPlayer.shared.play(song: song!)
        
    }
}
