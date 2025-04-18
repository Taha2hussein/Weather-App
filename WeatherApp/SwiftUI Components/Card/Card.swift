//
//  Card.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct Card<Content: View>: View {
    var title: String? = nil
    var titleFont: Font = .RERBody.bold
    var titleColor: Color = .RERtext.dimmed
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = .Spacing.xsSpace
    @ViewBuilder let content: Content
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }.padding(.vertical, verticalPadding).padding(.horizontal, horizontalPadding).background(Color.warning)
            .cornerRadius(8)
            .if(title != nil) { view in
                view.sectionTitle(title: title!)
            }
    }
}
