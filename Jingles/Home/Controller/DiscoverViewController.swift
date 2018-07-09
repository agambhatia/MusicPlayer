//
//  DiscoverViewController.swift
//  Jingles
//
//  Created by Mini31 on 28/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

import UIKit
import AVKit
import AVFoundation

class DiscoverViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    var searchResults: [Track] = []
    let queryService = QueryService()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    func playFromWeb(_ track: Track) {
        let playerViewController = AVPlayerViewController()
        let url = track.previewURL
        let player = AVPlayer(url: url)
        playerViewController.player = player
        MusicPlayer.shared.player?.pause()
        player.play()
        present(playerViewController, animated: true, completion: nil)
       
    }
    
}

// MARK: - UITableView

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
       
        let track = searchResults[indexPath.row]
        cell.configure(track: track)
        cell.artistLabel.highlightedTextColor = UIColor.orange
        cell.titleLabel.highlightedTextColor = UIColor.orange
        cell.backgroundColor = UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0
    }
    
    // When user taps cell, play the local file, if it's downloaded
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = searchResults[indexPath.row]
        playFromWeb(track)
        
        
//        if track.downloaded {
//            playDownload(track)
//        }
        
       // tableView.deselectRow(at: indexPath, animated: true)
    }
}


