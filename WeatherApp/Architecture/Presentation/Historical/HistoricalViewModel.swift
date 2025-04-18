//
//  HistoricalViewModel.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import Foundation
import SwiftUI

final class HistoricalViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var weatherResponse: City
    @Published var weatherHistory: [WeatherInfo] = []

    // MARK: - Init
    init(weatherResponse: City) {
        self.weatherResponse = weatherResponse
        
        if let weatherInfoSet = weatherResponse.weatherInfo as? Set<WeatherInfo> {
            self.weatherHistory = weatherInfoSet
                .sorted { ($0.timestamp ?? Date()) > ($1.timestamp ?? Date()) }
        }
    }
}
