//
//  HomeViewController.swift
//  Jingles
//
//  Created by Mini31 on 07/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    // MARK: Properties
    
    var items: [[HomeItem]] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
