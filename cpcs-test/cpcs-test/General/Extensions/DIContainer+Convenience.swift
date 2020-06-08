//
//  DIContainer+Convenience.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 07.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import Swinject

private let _container = Container()

public struct DIContainer {
    // MARK: - Public
    
    public static var defaultResolver: Container {
        return _container
    }
}
