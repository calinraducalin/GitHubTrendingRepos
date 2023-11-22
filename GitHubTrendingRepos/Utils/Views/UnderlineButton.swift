//
//  UnderlineButton.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import SwiftUI

struct UnderlineButton: View {
    let text: String
    var textColor: Color = .white
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(text)
                    .underline()
                    .foregroundStyle(textColor)
            }
        )
    }
}
