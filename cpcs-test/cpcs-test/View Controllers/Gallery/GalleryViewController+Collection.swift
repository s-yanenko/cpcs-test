//
//  GalleryViewController+Collection.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 18.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit
import Nuke

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Static functions
    
    static func dynamicItemSize(for collectionView: UICollectionView, sectionInsets: UIEdgeInsets, itemSpacing: CGFloat,
                               numberOfItemsInLine: Int, aspectRatio: Double) -> CGSize {
        let sectionWidth = collectionView.bounds.width - sectionInsets.left - sectionInsets.right
        let availableWidth = sectionWidth - itemSpacing * CGFloat(numberOfItemsInLine - 1)
        let itemWidth = round(availableWidth / CGFloat(numberOfItemsInLine))
        let itemHeight = round(itemWidth / CGFloat(aspectRatio))
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath) as? GalleryCollectionViewCell else {
            print("Failed to dequeue image cell!")
            return UICollectionViewCell()
        }
        guard imagesCollection.indices.contains(indexPath.row) else {
            print("NO image")
            return UICollectionViewCell()
        }
        let imageUrl = imagesCollection[indexPath.row]
        cell.updateWithImageURL(imageUrl)
        return cell
    }
    
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return GalleryViewController.dynamicItemSize(for: collectionView, sectionInsets: collectionSectionInset, itemSpacing: collectionItemSpacing, numberOfItemsInLine: 3, aspectRatio: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionSectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionItemSpacing
    }
    
}
