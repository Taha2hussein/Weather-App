//
//  HistoricalView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import SwiftUI
struct HistoricalView: View {
    @StateObject private var viewModel: HistoricalViewModel
    @StateObject private var router: HistoricalRouter
    
    init(viewModel: HistoricalViewModel, router: HistoricalRouter) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        NavigationWrapper(router: router) {
            ZStack {
                BackgroundImage()
                
                VStack(spacing: 16) {
                    HistoricalHeaderBar(title: viewModel.weatherResponse.name ?? "") {
                        router.goBack()
                    }
                    List {
                        ForEach($viewModel.weatherHistory, id: \.id) { info in
                            cityRow(for: info.wrappedValue)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .listStyle(PlainListStyle())
                }
                .padding(.horizontal)
            }
            .background(Color.actionDisabled.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func cityRow(for weatherInfo: WeatherInfo) -> some View {
        CustomListItem(
            item: weatherInfo,
            titleProvider: { item in
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                let date = formatter.string(from: item.timestamp ?? Date())
                let desc = item.weatherDesc ?? "N/A"
                let temp = Int(item.temperature)
                return "\(date)\n\(desc), \(temp)°C"
            },
            onTap: {
                    let homeDetailsBody = HomeDetailsView(
                        viewModel: HomeDetailsViewModel(weatherResponse: viewModel.weatherResponse),
                        router: router
                    )
                    router.presentSheet(view: AnyView(homeDetailsBody))
                
            },
            onTrailingButtonTap: {}
        )
    }
}

