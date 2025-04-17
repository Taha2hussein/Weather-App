//
//  WeatherRepositoryProtocol.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import EventHorizon

/// Protocol defining the operations for managing weather
protocol WeatherRepositoryProtocol: Sendable {
    /// Fetches weather from the API.
    /// - Returns: An array of  WeatherResponseDTO  objects.
    /// - Throws: An error if the request fails.
    func getWeather(search: String) async throws -> WeatherResponseDTO
}
