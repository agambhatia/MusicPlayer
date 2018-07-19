//
//  HomeViewController+CollectionView.swift
//  Jingles
//
//  Created by Mini31 on 07/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: CollectionView Methods

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionViewData.count == 0
        {
            return 1
        }
        else if collectionViewData.count > 10
        {
            return 10
        }
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.identifier,
                                                                for: indexPath) as? HomeItemCollectionViewCell else {
                                                                    return UICollectionViewCell()
        }
        if collectionViewData.count == 0
        {
            itemCell.artistNameLabel.text = "N/A"
            itemCell.songTitleLabel.text = "Not Playing"
            itemCell.imageView.image = #imageLiteral(resourceName: "icons8-music-record-100")
            itemCell.isUserInteractionEnabled = false
        }
        else{
        itemCell.songTitleLabel?.text = collectionViewData[indexPath.row].title
        itemCell.artistNameLabel?.text = collectionViewData[indexPath.row].artist
        itemCell.imageView?.image = collectionViewData[indexPath.row].albumArt
        }
         return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rowItem = collectionViewData[indexPath.row]
        print(rowItem.fileURL)
        MusicPlayer.shared.play(song: rowItem)
        print("User selected \(rowItem.title)")
    }
    
        
    
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.zero
//    }
    
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  //      return homeCollectionView.bounds.size
// }
}

