//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import UIKit
import EventHorizon


final class WeatherRepository: WeatherRepositoryProtocol {
    private let apiClient: any APIClientProtocol
    private typealias apiEndpoint = APIEndpointExample

    init(
        apiClient: any APIClientProtocol = APIClient(
            interceptors: Interceptors.example
        )
    ) {
        self.apiClient = apiClient
    }

    func getWeather(search: String) async throws -> WeatherResponseDTO {
        let fetchedWeather: WeatherResponseDTO = try await apiClient.request(apiEndpoint.getWeather(search: search))
        return fetchedWeather
    }


    
    private func log(_ string: String) {
        #if DEBUG
        print(string)
        #endif
    }
}
