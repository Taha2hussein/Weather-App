//
//  NoDataView.swift
//  WeatherApp
//
//  Created by Taha Hussein on 17/04/2025.
//

import SwiftUI

struct NoDataView: View {
    var text: String = "noData"
    var verticalPadding: CGFloat = .Spacing.xlSpace
    
    var body: some View {
        Card(verticalPadding: verticalPadding) {
            Text(text)
                .font(.RERBody.regular)
                .foregroundColor(.RERtext.dimmed)
                .frame(maxWidth: .infinity)
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView(text: "noData")
    }
}
