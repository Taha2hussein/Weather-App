//
//  HomeViewModelProtocol.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

/// A protocol defining the interface for a Home ViewModel.
///
/// The HomeViewModelProtocol provides properties and methods for managing weather
///
/// - Conforms to: MainActor
/// - Requires: ObservableObject to support SwiftUI's data-binding and reactivity.
@MainActor
protocol HomeViewModelProtocol: ObservableObject, Sendable {
    
    /// A list of weather managed by the ViewModel.
    ///
    /// This property provides the current collection of weather.
    var cities: [City] { get }
    
    func fetchCities()
    func deleteCity(at offsets: IndexSet)
    func addCity(name: String, response: WeatherResponseDTO)
}
