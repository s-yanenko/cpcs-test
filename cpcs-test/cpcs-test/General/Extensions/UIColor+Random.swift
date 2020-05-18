//
//  UIColor+Random.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 18.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
