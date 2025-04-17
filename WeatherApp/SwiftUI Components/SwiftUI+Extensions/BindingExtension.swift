//
//  BindingExtension.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
