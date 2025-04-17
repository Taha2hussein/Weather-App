//
//  SearchCountries.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct CountrySearchView: View {
    @StateObject var viewModel: CountrySearchViewModel
    @ObservedObject var router: HomeRouter

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(HeadersTitle.searchCountry.rawValue)
                .font(.RERBody.regular)
                .foregroundColor(Color.white)

            TextField(HeadersTitle.type.rawValue, text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            List {
                ForEach(viewModel.filteredCountries, id: \ .id) { city in
                    CustomListItem(
                        item: city,
                        titleProvider: { $0.name },
                        onTap: {
                            Task {
                                try await viewModel.getWeather()
                                router.dismissSheet()
                            }
                        },
                        onTrailingButtonTap: {}
                    )
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .listStyle(PlainListStyle())
        }
        .loadingOverlay(isShowing: $viewModel.isLoading)
        .padding()
        .background(Color.actionDisabled.ignoresSafeArea())
    }
}
