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
        
        let audioInfo = MPNowPlayingInfoCenter.default()
        print(audioInfo)
        for i in 0...Source.URLs.songs.count-1{
            guard let audioPath: URL = (Bundle.main.url(forResource: Source.URLs.songs[i], withExtension: "mp3")) else {
                return
            }
            let playerItem = AVPlayerItem(url: audioPath)
            let song = Song(from: playerItem, url: audioPath)
            LibraryManager.shared.songs.append(song!)
        }
    }
  
    
    func playSound(withAudioPath: URL ) {
        var player: AVAudioPlayer?
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            
            player = try AVAudioPlayer(contentsOf: withAudioPath, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            
            
            
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

