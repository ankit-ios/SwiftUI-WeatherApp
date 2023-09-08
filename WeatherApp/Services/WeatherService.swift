//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Ankit Sharma on 06/09/23.
//

import Foundation

struct WeatherService {
    
    func getWeather(city: String, completion: @escaping ((Weather?) -> ())) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=086199036743f1c4b070f4df554ad16e&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse {
                completion(weatherResponse.main)
            } else {
                completion(nil)
            }
            
        }.resume()
       
    }
}
