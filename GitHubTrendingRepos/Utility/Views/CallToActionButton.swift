//
//  CallToActionButton.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import SwiftUI

struct CallToActionButton: View {
    let text: String
    let action: () -> Void
    var textColor = Color.white
    var backgroundColor = Color.accentColor
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .foregroundColor(textColor)
            }
            .frame(maxWidth: 256)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}
