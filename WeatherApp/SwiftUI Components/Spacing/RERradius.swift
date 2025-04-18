//
//  Raduis.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation

extension CGFloat {
    struct RERRadius {
        private struct Primitives {
            static let sharp: CGFloat = 0
            static let sRaduis: CGFloat = 4
            static let mRaduis: CGFloat = 6
            static let lRaduis: CGFloat = 8
            static let xlRaduis: CGFloat = 16
            static let xl2Raduis: CGFloat = 40
            static let xl3Raduis: CGFloat = 128
        }
        static let sharp = Primitives.sharp
        static let sRaduis = Primitives.sRaduis
        static let mRaduis = Primitives.mRaduis
        static let lRaduis = Primitives.lRaduis
        static let xlRaduis = Primitives.xlRaduis
        static let xl2Raduis = Primitives.xl2Raduis
        static let xl3Raduis = Primitives.xl3Raduis
    }
}
