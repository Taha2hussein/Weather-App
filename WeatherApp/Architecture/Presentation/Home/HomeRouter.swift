//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI
import Combine

enum HomeRouterEnum: Hashable {
    case showHistorical(ciy: City)
}

protocol AnyRouter: ObservableObject {
    func presentSheet(view: AnyView)
    func dismissSheet()
}

// MARK: - HomeRouter
class HomeRouter: NavigationRouter, AnyRouter {
    typealias RouteType = HomeRouterEnum

    @Published var currentRoute: HomeRouterEnum?
    @Published var showSheet: Bool = false
    @Published var sheetContent: AnyView?
    @Published var shouldDismissSignup: Bool = false

    func navigate(to destination: HomeRouterEnum) {
        DispatchQueue.main.async {
            self.currentRoute = destination
        }
    }

    func goBack() {
        DispatchQueue.main.async {
            if self.currentRoute != nil {
                self.currentRoute = nil
            } else {
                self.shouldDismissSignup = true
            }
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

        case .showHistorical(ciy: let ciy):
            return AnyView(HistoricalView(viewModel: HistoricalViewModel(weatherResponse: ciy), router: HistoricalRouter()))
        }
    }
    
    var sheetView: AnyView {
        sheetContent ?? AnyView(EmptyView())  // Ensure non-optional return
    }
}
