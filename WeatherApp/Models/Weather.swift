//
//  Weather.swift
//  WeatherApp
//
//  Created by Ankit Sharma on 06/09/23.
//

import Foundation

struct WeatherResponse: Decodable {
    var main: Weather
}

struct Weather: Decodable {
    var humidity: Double?
    var temp: Double?
}

