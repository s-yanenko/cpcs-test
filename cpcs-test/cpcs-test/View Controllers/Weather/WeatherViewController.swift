//
//  WeatherViewController.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 11.05.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import Swinject

class WeatherViewController: ViewController {
    // MARK: - Properties
    
    let resolver: Resolver = DIContainer.defaultResolver
    private(set) var weatherManager: WeatherDataManager?
    private var updateTimer: Timer?
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    
    
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        setupDependecies()
        loadData()
    }
    
    deinit {
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
    
    // MARK: - Private
    
    private func setupDependecies() {
        weatherManager = resolver.resolve(WeatherDataManager.self)
        
        // Start updating timer
        updateTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
            guard let `self` = self else {
                return
            }
            self.loadData()
        }
    }
    
    private func loadData() {
        weatherManager?.getWeatherInfoFor(city: "Sumy") { [weak self] weather in
            guard let `self` = self else {
                return
            }
            self.updateWithWeather(weather)
        }
    }
    
    private func updateWithWeather(_ weather: WeatherInfo) {
        let celsius = round(weather.temperature - 273.15)
        temperatureLabel.text = String(celsius) + "° C"
        descriptionLabel.text = weather.description
        cityLabel.text = weather.city
    }
}
