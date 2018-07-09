//
//  Artisr.swift
//  Jingles
//
//  Created by Mini31 on 13/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

struct Artist {
    var name: String
    var songs: [Song]
    
    mutating func include(song: Song) {
        songs.append(song)
    }
    
}
