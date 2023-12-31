//
//  EmptyView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 24.11.2023.
//

import SwiftUI

struct EmptyView: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.title)
            Text(subtitle)
                .font(.headline)
        }
        .padding(32)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(title: "Title", subtitle: "Subtitle")
    }
}
