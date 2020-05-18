//
//  LifecycleViewController.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 11.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit

class LifecycleViewController: ViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var numLabel: UILabel!
    
    
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeTonotifications()
        configureLabel()
    }
    
    
    
    
    // MARK: - Private
    
    private func subscribeTonotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(configureLabel),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
    }
    
    @objc private func configureLabel() {
        let randomInt = Int.random(in: 1...100)
        numLabel.text = String(randomInt)
        numLabel.backgroundColor = UIColor.random
    }
}
