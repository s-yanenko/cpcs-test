//
//  WeatherDataManager.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 08.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import SwiftyJSON
import Swinject

protocol WeatherDataManager {
    func getWeatherInfoFor(city: String, completion: @escaping (WeatherInfo) -> ())
}

final class WeatherDataManagerImp: WeatherDataManager {
    // MARK: - Inner Types
    
    private struct Constants {
        static let weatherUrl = "https://api.openweathermap.org/data/2.5/weather"
        static let APIKey = "6caa1f3b1be4a04b95a88dd25c99ba26"
    }
    
    
    
    // MARK: - Properties
    
    let resolver: Resolver = DIContainer.defaultResolver
    private(set) var dataLoader: DataLoader?
    
    
    
    // MARK: - Initializers
    
    init() {
        dataLoader = resolver.resolve(DataLoader.self)
    }
    
    
    
    // MARK: - WeatherDataManager
    
    func getWeatherInfoFor(city: String, completion: @escaping (WeatherInfo) -> ()) {
        let params = ["q": city, "APPID": Constants.APIKey]
        dataLoader?.loadJSON(url: Constants.weatherUrl, parameters: params) { json in
            let weatherInfo = WeatherInfo(json: json)
            completion(weatherInfo)
        }
    }
    
}
