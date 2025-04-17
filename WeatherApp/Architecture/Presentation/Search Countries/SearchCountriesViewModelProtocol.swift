//
//  SearchCountriesViewModelProtocol.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import SwiftUI

/// A protocol defining the interface for a Home ViewModel.
///
/// The HomeViewModelProtocol provides properties and methods for managing weather
///
/// - Conforms to: MainActor
/// - Requires: ObservableObject to support SwiftUI's data-binding and reactivity.
@MainActor
protocol SearchCountriesViewModelProtocol: ObservableObject, Sendable {
    
    /// A list of weather managed by the ViewModel.
    
    @discardableResult
    func getWeather() async throws -> WeatherResponseDTO
    func filterCountries()
    func loadCountries()
   
}
