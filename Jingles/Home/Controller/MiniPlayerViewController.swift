//
//  MiniPlayerViewController.swift
//  Jingles
//
//  Created by Mini31 on 09/07/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class MiniPlayerViewController: UIViewController {
    
    
    
    @IBOutlet var miniPlayerView: UIView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var albumArt: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = MusicPlayer.shared.currentSong?.title
        albumArt.image = MusicPlayer.shared.currentSong?.albumArt
        guard let nowPlaying = MusicPlayer.shared.player?.isPlaying else
        {
            return
        }
        if nowPlaying
        {
            playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-filled-50"), for: .normal)
        }
        else
        {
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButtonClicked(_ sender: Any) {
        if (MusicPlayer.shared.player?.isPlaying)!
        {
            MusicPlayer.shared.player?.pause()
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
        }
        else
        {
            MusicPlayer.shared.player?.play()
            playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-filled-50"), for: .normal)
        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
