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
        
        let audioInfo = MPNowPlayingInfoCenter.default()
        print(audioInfo)
        let audioPath:NSURL? = Bundle.main.url(forResource: "01", withExtension: "mp3") as? NSURL
        
        
        //println("Playing \(audioPath)")
        
        
        let playerItem = AVPlayerItem(url: audioPath! as URL)
        let song = Song(from: playerItem)
        print(song)
        
//        let metadataList = playerItem.asset.metadata
//
//
//        for item in metadataList {
//
//
//            guard let key = item.commonKey, let value = item.value else{
//                continue
//            }
//            print("\(key.rawValue)")
//
//
//            switch key.rawValue {
//            case "albumName" : print("\(value)")
//            case "artist" : print("\(value)")
//            case "title" : print("\(value)")
//            case "type" : print("\(value)")
//            case "artwork" : print(" image")
//            default: print("\(value)")
//
//                continue
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
