//
//  HistoricalRouter.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import Foundation
import SwiftUI
import Combine

enum HistoricalRouterEnum: Hashable {
    case showDetails(weather: WeatherResponseDTO)
}

// MARK: - HomeRouter
class HistoricalRouter: NavigationRouter,AnyRouter {
    typealias RouteType = HistoricalRouterEnum
    @Published var currentRoute: HistoricalRouterEnum?
    @Published var showSheet: Bool = false
    @Published var sheetContent: AnyView?
    @Published var shouldDismissSignup: Bool = false

    func navigate(to destination: HistoricalRouterEnum) {
        DispatchQueue.main.async {
            self.currentRoute = destination
        }
    }

    func goBack() {
        DispatchQueue.main.async {
                self.currentRoute = nil
            
        }
    }

    func presentSheet(view: AnyView) {
        sheetContent = view
        showSheet = true
    }

    func dismissSheet() {
        sheetContent = nil
        showSheet = false
    }

    func resetNavigation() {
        currentRoute = nil
    }

    var destinationView: AnyView? {
        guard let route = currentRoute else { return nil }
        switch route {
        case .showDetails(let weather):
            return AnyView(EmptyView())
        }
    }
}
