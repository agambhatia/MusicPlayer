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



class HomeViewController: UIViewController {


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
        
        let audioInfo = MPNowPlayingInfoCenter.default()
        print(audioInfo)
        let audioPath:NSURL? = Bundle.main.url(forResource: "01_01", withExtension: "mp3") as? NSURL
        
        
        //println("Playing \(audioPath)")
        
        
        let playerItem = AVPlayerItem(url: audioPath! as URL)
        let song = Song(from: playerItem)
        print(song)
    }
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
