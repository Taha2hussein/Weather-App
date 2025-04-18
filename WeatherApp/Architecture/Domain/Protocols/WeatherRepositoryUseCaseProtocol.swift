//
//  WeatherRepositoryUseCaseProtocol.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import EventHorizon

/// Protocol defining the use case for managing weather-related operations.
protocol WeatherRepositoryUseCaseProtocol: Sendable {
    /// Retrieves posts using the WeatherRepository.
    /// - Returns: An array of  WeatherResponseDTO  objects.
    /// - Throws: An error if the service request fails.
    func getWeather(search: String) async throws -> WeatherResponseDTO
}
