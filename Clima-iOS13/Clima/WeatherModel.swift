//
//  WeatherModel.swift
//  Clima
//
//  Created by Navi Budhraja on 6/25/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    var conditionName: String {
        switch conditionId{
        case 200..<233:
            return "cloud.bolt"
        case 300..<322:
            return "cloud.drizzle"
        case 500..<532:
            return "cloud.rain"
        case 600..<623:
            return "could.snow"
        case 700..<782:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801..<805:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
    var temperatureString: String {
        return String(format:"%.1f", temperature)
    }
    
}
