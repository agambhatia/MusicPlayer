//
//  MiniPlayerViewController.swift
//  Jingles
//
//  Created by Mini31 on 09/07/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//


import UIKit
import NotificationCenter

class MiniPlayerViewController: UIViewController, SongIsPlayingDelegate {
    
    
    @IBOutlet var miniPlayerView: UIView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var albumArt: UIImageView!
     var buttonClicked = false
    var nowPlaying = false
    var loaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MusicPlayer.shared.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButtonClicked(_ sender: Any) {
        if nowPlaying {
            nowPlaying = !nowPlaying
            MusicPlayer.shared.player?.pause()
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
        }
        else
        {
            nowPlaying = !nowPlaying
            MusicPlayer.shared.player?.play()
            playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-filled-50"), for: .normal)
        }
    }
    
    
    func updateView(){
        if  nowPlaying
        {
            titleLabel.text = MusicPlayer.shared.currentSong?.title
            albumArt.image = MusicPlayer.shared.currentSong?.albumArt
            playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-filled-50"), for: .normal)
        }
        else
        {
            if loaded{
                titleLabel.text = MusicPlayer.shared.currentSong?.title
                albumArt.image = MusicPlayer.shared.currentSong?.albumArt
                 playButton.isEnabled = true
                
                
            }else{
            titleLabel.text = " Not Playing"
            albumArt.image =  #imageLiteral(resourceName: "icons8-music-record-100")
             
            playButton.isEnabled = false
        }
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
       }
    }
 
    func didPlaySong(played: Bool) {
        loaded  = true
        nowPlaying = played
        playButton.isEnabled = true
        updateView()
    }

   
    
    
}
