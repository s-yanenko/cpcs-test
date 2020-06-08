//
//  JSONIntitalizable.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 08.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import SwiftyJSON

/// Object, which can be initialized with JSON

public protocol JSONInitializable: Codable {
    /**
     Creates a new instance from `json` data.
     */
    init(json: JSON)
}
