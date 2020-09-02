//
//  WeatherManager.swift
//  Clima
//
//  Created by Navi Budhraja on 6/25/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=687a7e8d31cee4004512ca1fd707945b&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        
        var urlString = "\(weatherURL)&q=\(cityName)"
        
        if(cityName.contains(" ")){
             urlString = urlString.replacingOccurrences(of: " ", with: "%20")
        }
       
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(weather:weather)
                    }
                }
            }
            task.resume()
            
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weatherModel.temperatureString)
            
            return weatherModel
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
