//
//  HomeItemCollectionViewCell.swift
//  Jingles
//
//  Created by Mini31 on 07/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class HomeItemCollectionViewCell: UICollectionViewCell {
 
    static var estimatedSize: CGSize {
        let margins: CGFloat = 2*16.0
        let interCellSpacing: CGFloat = 16.0
        let width = UIScreen.main.bounds.width

        let availableWidth = width - margins - interCellSpacing
        
        let height = availableWidth + 50.0
        
        return CGSize(width: width, height: height)
    }
    
    @IBOutlet var imageView: UIImageView!
   
    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    
    /// Sets up the Subviews with respective item details
    ///
    /// - Parameter homeItem: The item which is represented by this view
    func set(with homeItem: HomeItem) {
        imageView.image = nil
        songTitleLabel.text = nil
        artistNameLabel.text = nil
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
