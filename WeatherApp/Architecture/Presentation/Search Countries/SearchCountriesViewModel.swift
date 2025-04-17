//
//  SearchCountriesViewModel.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//


// MARK: - CountrySearchViewModel.swift
import Foundation
import Combine

@MainActor
final class CountrySearchViewModel: SearchCountriesViewModelProtocol {
    
    // MARK: - Publishers
    @Published var allCountries: [Country] = []
    @Published var filteredCountries: [Country] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = "" {
        didSet { filterCountries() }
    }
    
    // MARK: - Dependencies
    private let weatherUseCase: WeatherRepositoryUseCaseProtocol
    private let countryLoader: CountryLoaderProtocol
    private let weatherSaver: WeatherPersistenceProtocol
    
    // MARK: - Initialization
    init(
        weatherUseCase: WeatherRepositoryUseCaseProtocol = WeatherRepositoryUseCase(),
        countryLoader: CountryLoaderProtocol = JSONCountryLoader(),
        weatherSaver: WeatherPersistenceProtocol = WeatherDataManager()
    ) {
        self.weatherUseCase = weatherUseCase
        self.countryLoader = countryLoader
        self.weatherSaver = weatherSaver
        loadCountries()
    }
    
    // MARK: - Load Countries
    func loadCountries() {
        let countries = countryLoader.loadCountries()
        allCountries = countries
        filteredCountries = countries
    }
    
    // MARK: - Filter Logic
    func filterCountries() {
        filteredCountries = searchText.isEmpty
        ? allCountries
        : allCountries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    // MARK: - Get Weather
    @discardableResult
    func getWeather() async throws -> WeatherResponseDTO {
        isLoading = true
        defer { isLoading = false }
        
        let result = try await weatherUseCase.getWeather(search: searchText)
        // make sure response has data
        if let _ = result.weather.first, result.main.temp != 0 {
            weatherSaver.save(cityName: searchText, response: result)
        }
        return result
    }
}
