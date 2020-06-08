//
//  DataLoader.swift
//  cpcs-test
//
//  Created by Serhii Yanenko on 07.06.2020.
//  Copyright © 2020 Serhii Yanenko. All rights reserved.
//

import Alamofire
import SwiftyJSON

// Protocol for objects, which are responsible for loading data.
protocol DataLoader {
    
    /// Loads JSON data wuth given URL and params, returns JSON data in completion.
    /// - Parameters:
    ///   - url: URL to load
    ///   - parameters: parameters for request.
    ///   - completion: Block with JSON data.
    func loadJSON(url: String, parameters: [String: Any], completion: @escaping (JSON) -> ())
}

final class DataLoaderImp: DataLoader {
    
    func loadJSON(url: String, parameters: [String: Any], completion: @escaping (JSON) -> ()) {
        AF.request(url, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}
