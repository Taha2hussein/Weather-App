//
//  EmptyStateView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var icon: String?
    var systemIcon: Image? = nil
    var text: String
    var buttonText: String
    var buttonIcon: Image?
    var buttonAction: () -> Void = {}
    var isButtonVisible: Bool = true
    var isPrimaryButtonStyle: Bool =  true
    
    var body: some View {
        VStack {
            if let systemIcon {
                systemIcon
                    .resizable()
                    .frame(width: 66, height: 66)
                    .padding(.vertical, .Spacing.xsSpace)
                    .foregroundColor(.RERicon.invert)
            } else {
                Image(icon ?? "")
             
                    .padding(.vertical, .Spacing.xs2Space)
            }
            Text(text)
                .font(.RERBody.regular)
                .foregroundColor(.RERtext.dimmed)
                .padding(.bottom, .Spacing.xsSpace)
            
            if isButtonVisible {
                Button {
                    buttonAction()
                } label: {
                    HStack {
                        if buttonIcon != nil {
                            buttonIcon
                        }
                        Text(buttonText)
                    }
                }.if(isPrimaryButtonStyle, transform: { view in
                    view.buttonStyle(RERPrimaryButtonStyle())
                })
                .if(!isPrimaryButtonStyle, transform: { view in
                    view.buttonStyle(RERSecondaryButtonStyle())
                })
                .padding(.horizontal, .Spacing.mSpace)
            }
        }
        .padding(.Spacing.lSpace)
        .background(Color.secondary)
        .cornerRadius(CGFloat.RERRadius.lRaduis)
        
    }
}

#Preview {
    EmptyStateView(icon: "calendar_noFill", text: "text", buttonText: "button")
}
