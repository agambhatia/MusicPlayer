//
//  HomeViewController+CollectionView.swift
//  Jingles
//
//  Created by Mini31 on 07/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

// MARK: CollectionView Methods

extension HomeViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.identifier,
                                                                for: indexPath) as? HomeItemCollectionViewCell else {
                                                                    return UICollectionViewCell()
        }	
        
        itemCell.songTitleLabel?.text = Source.URLs.songs[indexPath.row]
        itemCell.artistNameLabel?.text = " Unkown"
        itemCell.imageView?.image = #imageLiteral(resourceName: "AlbumArtSmall.jpg")
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionItem = items[indexPath.section]
        let rowItem = sectionItem[indexPath.row]
        
        print("User selected \(rowItem)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  //      return homeCollectionView.bounds.size
   // }
}

