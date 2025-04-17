//
//  NavigationRouter.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import SwiftUI

protocol NavigationRouter: ObservableObject {
    associatedtype RouteType: Hashable
    var currentRoute: RouteType? { get set }
    var showSheet: Bool { get set }
    var sheetContent: AnyView? { get set }

    func resetNavigation()
    var destinationView: AnyView? { get }
}

// MARK: - NavigationWrapper
struct NavigationWrapper<RouterType: NavigationRouter, Content: View>: View {
    @ObservedObject var router: RouterType
    let content: Content

    init(router: RouterType, @ViewBuilder content: @escaping () -> Content) {
        self.router = router
        self.content = content()
    }

    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    content
                        .navigationDestination(
                            isPresented: Binding(
                                get: { router.currentRoute != nil },
                                set: { if !$0 { router.resetNavigation() } }
                            )
                        ) {
                            router.destinationView
                        }
                }
            } else {
                NavigationView {
                    content
                        .background(
                            NavigationLink(
                                destination: router.destinationView,
                                isActive: Binding(
                                    get: { router.currentRoute != nil },
                                    set: { if !$0 { router.resetNavigation() } }
                                )
                            ) { EmptyView() }
                        )
                }
            }
        }
        .sheet(isPresented: $router.showSheet) {
            if let content = router.sheetContent {
                content
            } else {
                EmptyView()
            }
        }
    }
}
