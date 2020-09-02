//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Navi Budhraja on 6/25/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate{
    func didUpdateWeather(weather:WeatherModel)
    func didFailWithError(error: Error)
    
}
