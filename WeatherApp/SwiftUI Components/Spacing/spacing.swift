//
//  Spacing.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation

extension CGFloat {
    private struct SpacingPrimitives {
        static let zero: CGFloat = 0
        static let quarter: CGFloat = 2
        static let half: CGFloat = 4
        static let one: CGFloat = 8
        static let two: CGFloat = 16
        static let three: CGFloat = 24
        static let four: CGFloat = 32
        static let five: CGFloat = 40
        static let six: CGFloat = 48
        static let seven: CGFloat = 56
        static let eight: CGFloat = 64
        static let nine: CGFloat = 72
        static let ten: CGFloat = 80
        static let eleven: CGFloat = 88
        static let twelve: CGFloat = 96
        static let thirteen: CGFloat = 104
        static let fourteen: CGFloat = 112
        static let fifteen: CGFloat = 120
    }
    
    struct Spacing {
        static let none = SpacingPrimitives.zero
        static let xs4Space = SpacingPrimitives.quarter
        static let xs3Space = SpacingPrimitives.half
        static let xs2Space = SpacingPrimitives.one
        static let xsSpace = SpacingPrimitives.two
        static let sSpace = SpacingPrimitives.three
        static let mSpace = SpacingPrimitives.four
        static let lSpace = SpacingPrimitives.five
        static let xlSpace = SpacingPrimitives.six
        static let xl7Space = SpacingPrimitives.seven
        static let xl8Space = SpacingPrimitives.eight
        static let xl9Space = SpacingPrimitives.nine
        static let xl10Space = SpacingPrimitives.ten
    }
    
    struct Padding {
        static let stepsContainerMargin = SpacingPrimitives.fourteen
        static let pageConetntMargin = SpacingPrimitives.three
        static let mainScreenPadding = SpacingPrimitives.three
        static let fieldsVerticalSpacing = SpacingPrimitives.three
        
    }
}
