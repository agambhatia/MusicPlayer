//
//  HomeViewController+TabelView.swift
//  Jingles
//
//  Created by Mini31 on 14/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)
        
        return cell
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200  }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Recently Played"
        case 1: return "Recently Added"
        default: return " "
            
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
//        view.tintColor = UIColor.init(red: 255.0/255.0, green: 165.0/255.0, blue: 48.0/255.0, alpha: 1)
//        view.tintColor = UIColor.init(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0, alpha: 0.5)
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.textAlignment = .center
        
        
    }
    
}

