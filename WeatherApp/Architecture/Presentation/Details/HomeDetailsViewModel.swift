//
//  HomeDetailsViewModel.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import SwiftUI


@MainActor
final class HomeDetailsViewModel: HomeDetailsViewModelProtocol {
    
    // MARK: - Published Properties
    @Published var weatherResponse: City
    @Published var weatherInfoSet: WeatherInfo?
    @Published var isLoading: Bool = false
    @Published var weatherIcon: Image?

    // MARK: - Dependencies
    private let weatherUseCase: WeatherRepositoryUseCaseProtocol

    // MARK: - Init
    init(
        weatherResponse: City,
        weatherUseCase: WeatherRepositoryUseCaseProtocol = WeatherRepositoryUseCase()
    ) {
        self.weatherUseCase = weatherUseCase
        self.weatherResponse = weatherResponse
        if let weatherInfoSet = weatherResponse.weatherInfo as? Set<WeatherInfo> {
            self.weatherInfoSet = weatherInfoSet.first
        }
        Task { await self.fetchWeatherImage() }
    }

    // MARK: - Fetch Weather Icon
    func fetchWeatherImage() async {
        guard let icon = self.weatherInfoSet?.icon else { return }

        let urlString = "http://openweathermap.org/img/w/\(icon).png"
        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let uiImage = UIImage(data: data) {
                self.weatherIcon = Image(uiImage: uiImage)
            }
        } catch {
            print("Failed to load weather icon image: \(error)")
        }
    }
}

