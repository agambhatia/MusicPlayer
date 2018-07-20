//
//  HomeTableViewCell.swift
//  Jingles
//
//  Created by Mini31 on 14/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var homeCollectionView: UICollectionView!
    var collectionViewDataSource: [Song] = [] {
        didSet{
            homeCollectionView.reloadData()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    // collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionViewDataSource.count == 0
        {
            return 1
        }
        else if collectionViewDataSource.count > 10
        {
            return 10
        }
        return collectionViewDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.identifier,
                                                                for: indexPath) as? HomeItemCollectionViewCell else {
                                                                    return UICollectionViewCell()
        }
        if collectionViewDataSource.count == 0
        {
            itemCell.artistNameLabel.text = "N/A"
            itemCell.songTitleLabel.text = "None"
            itemCell.imageView.image = #imageLiteral(resourceName: "icons8-music-record-100")
            itemCell.isUserInteractionEnabled = false
        }
        else{
            itemCell.songTitleLabel?.text = collectionViewDataSource[indexPath.row].title
            itemCell.artistNameLabel?.text = collectionViewDataSource[indexPath.row].artist
            itemCell.imageView?.image = collectionViewDataSource[indexPath.row].albumArt
        }
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rowItem = collectionViewDataSource[indexPath.row]
        print(rowItem.fileURL)
        MusicPlayer.shared.play(song: rowItem)
        print("User selected \(rowItem.title)")
    }
    
}
