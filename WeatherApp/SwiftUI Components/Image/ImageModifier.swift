//
//  CustomImageView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct CustomImageView: View {
    let imageName: String
    let size: CGSize?

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: size?.width, height: size?.height)
    }
}
