//
//  WeatherDataManager.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import CoreData

protocol WeatherPersistenceProtocol {
    func save(cityName: String, response: WeatherResponseDTO)
    func fetchCities() -> [City]
    func fetchWeatherHistory(for city: City) -> [WeatherInfo]
    func deleteCity(_ city: City)
}

final class WeatherDataManager: WeatherPersistenceProtocol {
    private let context = PersistenceController.shared.context

    func save(cityName: String, response: WeatherResponseDTO) {
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", cityName)

        let city: City
        if let existing = try? context.fetch(fetchRequest).first {
            city = existing
        } else {
            city = City(context: context)
            city.name = cityName
            city.id = UUID()
        }

        let weatherInfo = WeatherInfo(context: context)
        weatherInfo.id = UUID()
        weatherInfo.timestamp = Date()
        weatherInfo.temperature = response.main.temp - 273.15
        weatherInfo.humidity = Int16(response.main.humidity)
        weatherInfo.windSpeed = response.wind.speed
        weatherInfo.weatherDesc = response.weather.first?.description ?? ""
        weatherInfo.icon = response.weather.first?.icon ?? ""
        weatherInfo.city = city

        city.addToWeatherInfo(weatherInfo)
        PersistenceController.shared.saveContext()
    }
    
        // Fetch all cities
        func fetchCities() -> [City] {
            let request: NSFetchRequest<City> = City.fetchRequest()
            return (try? context.fetch(request)) ?? []
        }
    
        // Fetch historical weather for a city
        func fetchWeatherHistory(for city: City) -> [WeatherInfo] {
            let request: NSFetchRequest<WeatherInfo> = WeatherInfo.fetchRequest()
            request.predicate = NSPredicate(format: "city == %@", city)
            request.sortDescriptors = [NSSortDescriptor(keyPath: \WeatherInfo.timestamp, ascending: false)]
            return (try? context.fetch(request)) ?? []
        }
    
        // Delete a city (and cascade delete weather history)
        func deleteCity(_ city: City) {
            context.delete(city)
            PersistenceController.shared.saveContext()
        }

}
