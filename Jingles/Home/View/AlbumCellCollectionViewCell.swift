//
//  AlbumCellCollectionViewCell.swift
//  Jingles
//
//  Created by Mini31 on 02/07/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class AlbumCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var albumNameLabel: UILabel!
    
    func configure(album: Album) {
        albumNameLabel.text = album.title
        imageView.image = album.image
    }
    
}
