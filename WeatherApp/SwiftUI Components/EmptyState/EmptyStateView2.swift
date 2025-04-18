//
//  EmptyStateView2.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct EmptyStateView2: View {
    var icon: Image?
    var iconColor: Color?
    var title: String?
    var text: String?
    var buttonText: String?
    var buttonIcon: Image?
    var buttonAction: () -> Void = {}
    var isButtonVisible: Bool = true
    var isPrimaryButtonStyle: Bool =  true
    var spacing: CGFloat? = .Spacing.xsSpace
    
    var body: some View {
        Card(verticalPadding: .Spacing.lSpace) {
            VStack(spacing: spacing) {
                if let icon {
                    icon
                        .renderingMode(.template)
                        .foregroundStyle(Color.RERicon.invert)
                }
                VStack(spacing: 0) {
                    if let title {
                        Text(title)
                            .font(.RERBody.bold)
                            .foregroundColor(.RERtext.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    if let text {
                        Text(text)
                            .font(.RERCaption1.regular)
                            .foregroundColor(.RERtext.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
                if isButtonVisible {
                    Button {
                        buttonAction()
                    } label: {
                        HStack {
                            if buttonIcon != nil {
                                buttonIcon
                            }
                            Text(buttonText ?? "")
                        }
                    }.if(isPrimaryButtonStyle, transform: { view in
                        view.buttonStyle(RERPrimaryButtonStyle())
                    })
                    .if(!isPrimaryButtonStyle, transform: { view in
                        view.buttonStyle(RERSecondaryButtonStyle(width: 108, height: .Spacing.mSpace, font: .RERCaption1.bold))
                    })
                    .padding(.horizontal, .Spacing.mSpace)
                }
            }
        }
    }
}
#Preview {
    EmptyStateView2(buttonText: "")
}
