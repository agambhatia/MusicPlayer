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
        return Source.URLs.songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.identifier,
                                                                for: indexPath) as? HomeItemCollectionViewCell else {
                                                                    return UICollectionViewCell()
        }	
        if indexPath.section == 0 {
            if MusicPlayer.shared.recents.count == 0
            {
                itemCell.songTitleLabel.text = "Not Playing"
                itemCell.artistNameLabel.text = " N/A "
                itemCell.imageView.image = #imageLiteral(resourceName: "icons8-drums-100")
                return itemCell
            }
            else
            {
                itemCell.songTitleLabel.text = MusicPlayer.shared.recents[indexPath.row].title
                itemCell.artistNameLabel.text = MusicPlayer.shared.recents[indexPath.row].album
                itemCell.imageView.image = MusicPlayer.shared.recents[indexPath.row].albumArt
                return itemCell
            }
        }
       
        
        itemCell.songTitleLabel?.text = LibraryManager.shared.songs[indexPath.row].title
        itemCell.artistNameLabel?.text = LibraryManager.shared.songs[indexPath.row].artist
        itemCell.imageView?.image = LibraryManager.shared.songs[indexPath.row].albumArt
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rowItem = LibraryManager.shared.songs[indexPath.row]
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

