//
//  CustomListItem.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import Foundation
import SwiftUI

struct CustomListItem<T>: View {
    let item: T
    let titleProvider: (T) -> String
    let onTap: () -> Void
    let onTrailingButtonTap: (() -> Void)?

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                HStack {
                    Text(titleProvider(item))
                        .font(.RERBody.bold)
                        .foregroundColor(Color.actionSecondary)
                    Spacer()
                    if let trailingAction = onTrailingButtonTap {
                        Button(action: trailingAction) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.info)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                Divider()
                    .background(Color.gray.opacity(0.4))
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
        .listRowBackground(Color.clear)
    }
}
