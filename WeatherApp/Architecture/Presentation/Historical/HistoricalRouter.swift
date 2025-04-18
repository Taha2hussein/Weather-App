//
//  HistoricalRouter.swift
//  WeatherApp
//
//  Created by Taha Hussein on 18/04/2025.
//

import Foundation
import SwiftUI
import Combine

enum HistoricalRouterEnum: Hashable { }

// MARK: - HomeRouter
class HistoricalRouter: NavigationRouter, AnyRouter {
    
    typealias RouteType = HistoricalRouterEnum
    @Published var currentRoute: HistoricalRouterEnum?
    @Published var showSheet: Bool = false
    @Published var sheetContent: AnyView?
    @Published var shouldDismissSignup: Bool = false
    
    func navigate(to destination: HistoricalRouterEnum) {
        self.currentRoute = destination
    }
    
    func goBack() {
        self.currentRoute = nil
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
        switch route {}
    }
    
    var sheetView: AnyView {
        sheetContent ?? AnyView(EmptyView())  // Ensure non-optional return
    }
}
