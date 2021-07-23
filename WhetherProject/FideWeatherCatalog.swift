//
//  FideWeatherCatalog.swift
//  WhetherProject
//
//  Created by Олег Малышев on 17.06.2021.
//

import Foundation

struct Days: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezone_offset: Int
    var daily: [Daily]
}

struct Daily: Codable {
    var dt: Double
    var sunrise: Int
    var sunset: Int
    var moonrise: Int
    var moonset: Int
    var moon_phase: Double
    var temp: Temp
    var feels_like: Feels_like
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var wind_speed: Double
    var wind_deg: Int
    var wind_gust: Double
    var weather: [Weather]
    var clouds: Int
    var pop: Double
    var uvi: Double

}


struct Temp: Codable {
    var day: Double
    var min: Double
    var max: Double
    var night: Double
    var eve: Double
    var morn: Double
}

struct Feels_like: Codable {
    var day: Double
    var night: Double
    var eve: Double
    var morn: Double
}



