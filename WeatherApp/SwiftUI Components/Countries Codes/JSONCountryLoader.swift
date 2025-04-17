//
//  JSONCountryLoader.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
protocol CountryLoaderProtocol {
    func loadCountries() -> [Country]
}

struct JSONCountryLoader: CountryLoaderProtocol {
    func loadCountries() -> [Country] {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let countries = try? JSONDecoder().decode([Country].self, from: data) else {
            return []
        }
        return countries
    }
}
