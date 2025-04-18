//
//  Common.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI
enum HeadersTitle: String, CaseIterable {
    case homeTitle = "Cities"
    case searchCountry = "Enter city, postcode or airoport location"
    case type = "Type a country..."
}

struct BackgroundImage: View {
    var body: some View {
        VStack {
            Spacer()
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(height: 240)
                .clipped()
        }
        .ignoresSafeArea()
    }
}

struct NavigationTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.RERBody.bold)
            .foregroundColor(Color.actionSecondary)
            .frame(maxHeight: 50, alignment: .top)
    }
}

struct HeaderBar: View {
    var title: String
    var onPlusTapped: () -> Void
    
    var body: some View {
        HStack {
            NavigationTitle(title: title)
                .padding(.trailing, 90)
                        
            Button(action: {
                onPlusTapped()
            }) {
                ZStack {
                    Image("Button_right")
                    
                    Text("+")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.alert)
                        .padding(.bottom, 36)
                        .padding(.leading, 36)
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: 72, alignment: .trailing)
    }
}

struct HistoricalHeaderBar: View {
    var title: String
    var onPlusTapped: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onPlusTapped()
            }) {
                ZStack {
                    Image("Button_left")
                    
                    Text("<")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.alert)
                        .padding(.bottom, 36)
                        .padding(.trailing, 36)
                }
            }
            
            NavigationTitle(title: title)
                .padding(.leading, 90)
                        
        }.frame(width: UIScreen.screenWidth, height: 72, alignment: .leading)
    }
}
