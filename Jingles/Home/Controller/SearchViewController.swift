//
//  SearchViewController.swift
//  Jingles
//
//  Created by Mini31 on 20/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate, UITableViewDataSource {
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    var searchActive: Bool = false
    
    var data: [String] = []
    
    var filtered: [String] = []
    var flag: Bool = false
    var flag2: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    
        searchBar.delegate = self
        
        
        if 	searchBar.selectedScopeButtonIndex == 0{
            for i in 0...Source.URLs.songs.count-1{
            let trackTitle = LibraryManager.shared.songs[i].title
            data.append(trackTitle)
                self.tableView.reloadData()
        }
        }
        else if searchBar.selectedScopeButtonIndex == 1{
            for i in 0...LibraryManager.shared.atists.count-1{
                let artistTitle = LibraryManager.shared.songs[i].artist
                data.append(artistTitle)
                print("\(LibraryManager.shared.atists.count)")
                self.tableView.reloadData()
            }
        }
        

    }
    
    
    
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        flag = false
        flag2 = true
        print("1")
        searchBar.text = ""
        searchBar.endEditing(true)
        self.tableView.reloadData()
     
    }
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if(filtered.count == 0){
            searchActive = false
            flag = true
        }else {
            searchActive = true
        }
        self.tableView.reloadData()
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewController")
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.highlightedTextColor = UIColor.orange
        cell?.backgroundColor = UIColor.black
        
        if(searchActive){
            cell?.textLabel?.text = filtered[indexPath.row]
        }
        else if(!searchActive && flag)
        {
            cell?.textLabel?.text = "No Mathes Found"
        }
         else if flag2 == true
         {
            cell?.textLabel?.text = data[indexPath.row]
         }
        else {
            cell?.textLabel?.text = data[indexPath.row]
        }
      
        return cell!
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchActive)
        {
            return filtered.count
        }
            else if(!searchActive && flag)
        {
            return 1
        }
            else if (flag2 == true)
            {
                return data.count
            }
        else{
        return data.count
        }
    }
    
    

}
