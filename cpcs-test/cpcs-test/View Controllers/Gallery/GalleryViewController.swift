//
//  GalleryViewController.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 11.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit


class GalleryViewController: ViewController {
    // MARK: - InnerTypes
    
    struct Constants {
        static let cellReuseIdentifier = "imageCell"
        static let defaultImageExtension = ".jpg"
        static let imagesDirectory = "/gallery"
    }
    
    
    
    // MARK: - Properties
    
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    private(set) var imagesCollection: [URL] = []
    
    var collectionSectionInset: UIEdgeInsets {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return UIEdgeInsets(top: 20, left: 8, bottom: 10, right: 8)
        case .pad:
            return UIEdgeInsets(top: 32, left: 40, bottom: 10, right: 40)
        default:
            return UIEdgeInsets.zero
        }
    }
    
    var collectionItemSpacing: CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 8
        case .pad:
            return 16
        default: // pad
            return 0
        }
    }
    
    
    
    // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
    }
    
    
  
    // MARK: - Private
    
    private func loadImages() {
        guard let urlList = Bundle.main.urls(forResourcesWithExtension: Constants.defaultImageExtension, subdirectory: Constants.imagesDirectory) else {
            return
        }
        imagesCollection = urlList
    }
}
