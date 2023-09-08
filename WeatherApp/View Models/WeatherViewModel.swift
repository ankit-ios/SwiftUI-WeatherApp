//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ankit Sharma on 06/09/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private let weatherService: WeatherService!
    
    @Published var weather: Weather?
    var cityName: String = ""
    
    init() {
        weatherService = WeatherService()
    }
    
    var humidity: String {
        if let humidity = weather?.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var temperature: String {
        if let temperature = weather?.temp {
            return String(format: "%.0f", temperature)
        } else {
            return ""
        }
    }
    
    
    func search() {
        if let cityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(cityName: cityName)
        }
    }
    
    private func fetchWeather(cityName: String) {
        weatherService.getWeather(city: cityName) { [weak self] weather in
            if let weather {
                DispatchQueue.main.async {
                    self?.weather = weather
                }
            }
        }
    }
}
