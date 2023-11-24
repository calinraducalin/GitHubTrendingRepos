//
//  ScaleButtonStyle.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        withAnimation {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)

        }
    }
}
