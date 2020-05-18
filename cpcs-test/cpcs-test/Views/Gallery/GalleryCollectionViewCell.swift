//
//  GalleryCollectionViewCell.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 14.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit
import Nuke

class GalleryCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    @IBOutlet private var imageView: UIImageView!
    
    
    
    // MARK: - Overrides
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    
    
    // MARK: - Public
    
    func updateWithImageURL(_ url: URL) {
        Nuke.loadImage(with: url, into: imageView)
    }
}

