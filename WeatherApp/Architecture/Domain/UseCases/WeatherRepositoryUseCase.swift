//
//  WeatherRepositoryUseCase.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import EventHorizon

/// Concrete implementation of WeatherRepositoryUseCaseProtocol for managing weather-related operations.
final class WeatherRepositoryUseCase: WeatherRepositoryUseCaseProtocol {

    private let weatherRepository: any WeatherRepositoryProtocol

    init(weatherRepository: any WeatherRepositoryProtocol = WeatherRepository()) {
        self.weatherRepository = weatherRepository
    }

    func getWeather(search: String) async throws -> WeatherResponseDTO {
        return try await weatherRepository.getWeather(search: search)
    }
}
