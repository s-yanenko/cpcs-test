//
//  WeatherInfo.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 08.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import SwiftyJSON

struct WeatherInfo {
    let temperature: Double
    let city: String
    let description: String?
}

extension WeatherInfo: JSONInitializable {
    init(json: JSON) {
        temperature = json["main"]["temp"].doubleValue
        city = json["name"].stringValue
        let descriptionObject = json["weather"].arrayValue.first
        description = descriptionObject?["description"].stringValue 
    }
}
