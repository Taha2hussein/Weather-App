//
//  HomeView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @StateObject private var router: HomeRouter

    init(viewModel: HomeViewModel, router: HomeRouter) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = StateObject(wrappedValue: router)
    }

    var body: some View {
        NavigationWrapper(router: router) {
            ZStack {
                BackgroundImage()

                VStack(spacing: 16) {
                    HeaderBar(title: HeadersTitle.homeTitle.rawValue) {
                        presentSearchView()
                    }

                    List {
                        ForEach(viewModel.cities, id: \.id) { city in
                            cityRow(for: city)
                        }
                        .onDelete(perform: viewModel.deleteCity)
                    }
//                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .listStyle(PlainListStyle())
                }
                .padding(.horizontal)
            }
            .background(Color.actionDisabled.ignoresSafeArea())
        }
        .onAppear {
            viewModel.fetchCities()
        }
        .onChange(of: router.showSheet) { isPresented in
            if !isPresented {
                viewModel.fetchCities()
            }
        }
    }

    private func presentSearchView() {
        let countrySearchBody = CountrySearchView(
            viewModel: CountrySearchViewModel(),
            router: router
        )
        router.presentSheet(view: AnyView(countrySearchBody))
    }

    private func cityRow(for city: City) -> some View {
        CustomListItem(
            item: city,
            titleProvider: { $0.name ?? "" },
            onTap: {
                guard let weatherInfoSet = city.weatherInfo as? Set<WeatherInfo>  else { return }
                    
                    let homeDetailsBody = HomeDetailsView(
                        viewModel: HomeDetailsViewModel(weatherResponse: city, weatherInfoSet: weatherInfoSet.first!),
                        router: router
                    )
                    router.presentSheet(view: AnyView(homeDetailsBody))
                
            },
            onTrailingButtonTap: {
                router.navigate(to: .showHistorical(ciy: city))
            }
        )
        
    }
}
