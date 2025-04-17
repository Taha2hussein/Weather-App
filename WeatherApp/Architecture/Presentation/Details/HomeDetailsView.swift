//
//  HomeDetailsView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import SwiftUI
import SwiftUI

struct HomeDetailsView: View {
    @StateObject var viewModel: HomeDetailsViewModel
    @ObservedObject var router: HomeRouter
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 20) {
                // MARK: - Header
                HStack {
                    Button(action: {
                        router.dismissSheet()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(RoundedCorner(radius: 12, corners: [.bottomRight]))
                    }
                    
                    Spacer()
                    
                    Text(viewModel.weatherResponse.name ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Spacer()
                
                // MARK: - Weather Card
                VStack(spacing: 24) {
                    viewModel.weatherIcon?
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("DESCRIPTION")
                            Text("TEMPERATURE")
                            Text("HUMIDITY")
                            Text("WINDSPEED")
                        }
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 16) {
                            
                            if let firstWeatherInfo = viewModel.weatherInfoSet  {
                                Text(firstWeatherInfo.weatherDesc ?? "")
                                let temperature = firstWeatherInfo.temperature
                                Text("\(Int(temperature))° C")
                                let humidity = firstWeatherInfo.humidity
                                Text("\(Int(humidity))%")
                                let windSpeed = firstWeatherInfo.windSpeed
                                Text("\(Int(windSpeed)) km/h")
                                
                            }
                            
                        }
                        .foregroundColor(.red)
                        .font(.headline)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.85))
                .cornerRadius(32)
                .padding(.horizontal, 24)
                
                Spacer()
                
                // MARK: - Footer
                VStack(spacing: 4) {
                    Text("WEATHER INFORMATION FOR \(viewModel.weatherResponse.name ?? "") RECEIVED ON")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                .padding(.bottom)
            }
        }
        .background(Color.actionDisabled.ignoresSafeArea())
        .loadingOverlay(isShowing: $viewModel.isLoading)
    }
}
