//
//  HomeViewController.swift
//  Jingles
//
//  Created by Mini31 on 07/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class HomeViewController: UIViewController{
   
    
    
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    

    
    // MARK: Properties
    
    var items: [[HomeItem]] = [] {
        didSet {
            //homeCollectionView.reloadData()
        }
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

