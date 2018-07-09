//
//  TrackCell.swift
//  Jingles
//
//  Created by Mini31 on 28/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit


class TrackCell: UITableViewCell {
    
    // Delegate identifies track for this cell,
    // then passes this to a download service method.
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
  
    func configure(track: Track) {
        titleLabel.text = track.name
        artistLabel.text = track.artist
       
    }
    
}
