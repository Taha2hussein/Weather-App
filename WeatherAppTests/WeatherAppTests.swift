//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Taha Hussein on 17/04/2025.
//

import XCTest
@testable import WeatherApp
@MainActor
final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockPersistenceManager: MockWeatherPersistenceManager!

    override func setUp() {
        super.setUp()
        mockPersistenceManager = MockWeatherPersistenceManager()
        viewModel = HomeViewModel(persistenceManager: mockPersistenceManager)
    }

    override func tearDown() {
        viewModel = nil
        mockPersistenceManager = nil
        super.tearDown()
    }


     func testDeleteCity() {
         let city = City()
         viewModel.cities = [city]

        viewModel.deleteCity(at: IndexSet([0]))

        XCTAssertTrue(mockPersistenceManager.deleteCityCalled)
        XCTAssertTrue(viewModel.cities.isEmpty)
    }

    func testAddCity() {
        let cityName = "New City"
        let weatherResponse = WeatherResponseDTO()
        viewModel.addCity(name: cityName, response: weatherResponse)

        XCTAssertTrue(mockPersistenceManager.saveCityCalled)
    }
    

}

// Mock persistence manager for testing
class MockWeatherPersistenceManager: WeatherPersistenceProtocol {
    func fetchWeatherHistory(for city: WeatherApp.City) -> [WeatherApp.WeatherInfo] {
        return []
    }
    
    var mockCities: [City] = []
    var saveCityCalled = false
    var deleteCityCalled = false

    func fetchCities() -> [City] {
        return mockCities
    }

    func deleteCity(_ city: City) {
        deleteCityCalled = true
    }

    func save(cityName: String, response: WeatherResponseDTO) {
        saveCityCalled = true
    }
}
