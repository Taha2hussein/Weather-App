//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation

struct WeatherResponseDTO: Codable, Hashable {
    let name: String
    let main: MainInfo
    let weather: [Weather]
    let wind: Wind
    let dt: Int

    init(
        name: String = "",
        main: MainInfo = MainInfo(),
        weather: [Weather] = [],
        wind: Wind = Wind(),
        dt: Int = 0
    ) {
        self.name = name
        self.main = main
        self.weather = weather
        self.wind = wind
        self.dt = dt
    }
}

struct MainInfo: Codable, Hashable {
    let temp: Double
    let humidity: Int

    init(temp: Double = 0.0, humidity: Int = 0) {
        self.temp = temp
        self.humidity = humidity
    }
}

struct Weather: Codable, Hashable {
    let main: String
    let description: String
    let icon: String

    init(main: String = "", description: String = "", icon: String = "") {
        self.main = main
        self.description = description
        self.icon = icon
    }
}

struct Wind: Codable, Hashable {
    let speed: Double

    init(speed: Double = 0.0) {
        self.speed = speed
    }
}
