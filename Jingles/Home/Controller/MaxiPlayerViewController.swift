//
//  MaxiPlayerViewController.swift
//  Jingles
//
//  Created by Mini31 on 22/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class MaxiPlayerViewController: UIViewController {
    
    
    var shuffleOn: Bool = false
    var repeatOn: Bool = false
    var nowPlaying: Bool = true
    var audioTimer: Timer?            // holds a timer instance
    var isDraggingTimeSlider = false
    var nextSong : Song?
    var prevSong: Song?
    
    
    
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var seekSlider: UISlider!
    @IBOutlet var shuffleButton: UIButton!
    @IBOutlet var repeatButton: UIButton!
    
    func updateViewForCurrentSong(){
        guard let currentlyPlayingSong = MusicPlayer.shared.currentSong else {
            return
        }
        
        
        guard let  next = MusicPlayer.shared.nextSong else{
            return
        }
        nextSong = next
        
        guard let  prev = MusicPlayer.shared.prevSong else{
            return
        }
        prevSong = prev

        artistLabel.text = currentlyPlayingSong.artist
        titleLabel.text = currentlyPlayingSong.title
        seekSlider.maximumValue = Float((MusicPlayer.shared.player?.duration)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewForCurrentSong()
        
        makeTimer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func shuffleButtonClicked(_ sender: Any) {
        shuffleOn = !shuffleOn
        if shuffleOn{
            shuffleButton.setImage( #imageLiteral(resourceName: "icons8-shuffle-24"), for: .normal)
        }
        else {
            shuffleButton.setImage(#imageLiteral(resourceName: "icons8-shuffle-white"), for: .normal)
        }
    }
    
    @IBAction func repeatButtonClicked(_ sender: Any) {
        repeatOn = !repeatOn
        if repeatOn{
            repeatButton.setImage(#imageLiteral(resourceName: "icons8-repeat-24"), for: .normal)
            MusicPlayer.shared.player?.numberOfLoops = -1
            
            
        } else{
            repeatButton.setImage(#imageLiteral(resourceName: "icons8-repeat-white"), for: .normal)
            MusicPlayer.shared.player?.numberOfLoops = 0
            
        }
    }
    
    @IBAction func playButtonClicked(_ sender: Any) {
        nowPlaying = !nowPlaying
        if nowPlaying{
            playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-filled-50"), for: .normal)
            MusicPlayer.shared.player?.play()
            
        } else {
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
            MusicPlayer.shared.player?.pause()
        }
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if repeatOn
        {
            MusicPlayer.shared.play(song: MusicPlayer.shared.currentSong! )
        }
        else if shuffleOn
        {
        MusicPlayer.shared.play(song: LibraryManager.shared.songs[Int(arc4random_uniform(UInt32(LibraryManager.shared.songs.count)))])
        }
        else
        {
            MusicPlayer.shared.play(song: nextSong!)
        }
        updateViewForCurrentSong()
        
    }
    
    @IBAction func previousButtonClicked(_ sender: Any) {
        if repeatOn
        {
            MusicPlayer.shared.play(song: MusicPlayer.shared.currentSong! )
        }
        else if shuffleOn
        {
            MusicPlayer.shared.play(song: LibraryManager.shared.songs[Int(arc4random_uniform(UInt32(LibraryManager.shared.songs.count)))])
        }
        else
        {
            MusicPlayer.shared.play(song: prevSong!)
        }
        updateViewForCurrentSong()
    }
    
    @IBAction func seekBarMoved(_ sender: Any) {
        MusicPlayer.shared.player?.currentTime = Double(seekSlider.value)
        seekSlider.setValue(seekSlider.value, animated: true)
        //        MusicPlayer.shared.player?.play()
        
    }
    
    @IBAction func seekSliderTouchDown(_ sender: Any) {
        isDraggingTimeSlider = true
    }
    
    @IBAction func seekSliderTouchUpOutside(_ sender: Any) {
        isDraggingTimeSlider = false
    }
    @IBAction func seekSliderTouchUpInside(_ sender: Any) {
        isDraggingTimeSlider = false
    }
}


extension MaxiPlayerViewController {
    
    // Timer
    
    func makeTimer() {
        // This function sets up the timer.
        if audioTimer != nil {
            audioTimer!.invalidate()
        }
        
        
        audioTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func onTimer(timer: Timer) {
        guard let currentTime =  MusicPlayer.shared.player?.currentTime, let duration =  MusicPlayer.shared.player?.duration else {
            return
        }
        
        let percentCompleted = currentTime
        
        // Everything is cool so update the timeLabel and progress bar
        //        seekSlider.value = Float(percentCompleted)
        //seekSlider.setValue(Float(percentCompleted), animated: true)
        // Check that we aren't dragging the time slider before updating it
        
        if !isDraggingTimeSlider {
            
            seekSlider.setValue(Float(percentCompleted), animated: true)
            if seekSlider.value == seekSlider.minimumValue && !(MusicPlayer.shared.player?.isPlaying)! && shuffleOn
            {
                MusicPlayer.shared.play(song: LibraryManager.shared.songs[Int(arc4random_uniform(UInt32(LibraryManager.shared.songs.count)))] )
                updateViewForCurrentSong()
            }
            else if !(MusicPlayer.shared.player?.isPlaying)!
            {
                nowPlaying = false
                playButton.setImage(#imageLiteral(resourceName: "icons8-play-button-circled-filled-50"), for: .normal)
                
            }
            
        }
    }
    
}
