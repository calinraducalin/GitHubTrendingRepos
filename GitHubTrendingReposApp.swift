//
//  GitHubTrendingReposApp.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 21.11.2023.
//

import SwiftUI

@main
struct GitHubTrendingReposApp: App {
    
    init() {
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            TrendingView()
        }
    }
}
