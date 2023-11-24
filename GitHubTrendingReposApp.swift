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
        URLCache.shared.removeAllCachedResponses()
        UICollectionView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
