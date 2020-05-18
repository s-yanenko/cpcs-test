//
//  RootViewController.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 11.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .pad ? .landscape : .portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
