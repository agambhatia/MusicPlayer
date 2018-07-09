//
//  DicoverBarDeligate.swift
//  Jingles
//
//  Created by Mini31 on 28/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import Foundation
import UIKit

extension DiscoverViewController: UISearchBarDelegate {
  
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        queryService.getSearchResults(searchTerm: searchText) { results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
               if results.count > 0 {
                self.searchResults = results
                self.tableView.reloadData()
                self.tableView.setContentOffset(CGPoint.zero, animated: false)
            }
            if !errorMessage.isEmpty  { print("Search error: " + errorMessage) }
        }
    }
   
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}
