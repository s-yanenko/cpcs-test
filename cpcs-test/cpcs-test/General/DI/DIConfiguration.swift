//
//  DIConfiguration.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 07.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import Swinject

struct DIConfiguration {
    
    static func setup(_ container: Container) {
        setupGeneral(container)
    }
    
    
    
    // MARK: - Private
    
    private static func setupGeneral(_ container: Container) {
        container.register(DataLoader.self) { _ in DataLoaderImp() }
            .inObjectScope(.container)
        container.register(WeatherDataManager.self) { _ in WeatherDataManagerImp() }
            .inObjectScope(.container)
    }
}
