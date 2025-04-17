//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import UIKit
import EventHorizon
import CoreData

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    @Published var cities: [City] = []
    
    private let persistenceManager: WeatherPersistenceProtocol

    // MARK: - Initialization
    
    init(persistenceManager: WeatherPersistenceProtocol = WeatherDataManager()) {
        self.persistenceManager = persistenceManager
    }

    // MARK: - Public Methods
    func fetchCities() {
        cities = persistenceManager.fetchCities()
    }

    func deleteCity(at offsets: IndexSet) {
        for index in offsets {
            let city = cities[index]
            persistenceManager.deleteCity(city)
        }
        fetchCities()
    }

    func addCity(name: String, response: WeatherResponseDTO) {
        persistenceManager.save(cityName: name, response: response)
        fetchCities()
    }
}
