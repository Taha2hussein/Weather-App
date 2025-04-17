//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI
import Combine

enum HomeRouterEnum: Hashable {
    case showDetails(weather: WeatherResponseDTO)
}

// MARK: - HomeRouter
class HomeRouter: NavigationRouter {
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
        case .showDetails(let weather):
            return AnyView(EmptyView())
        }
    }
}
