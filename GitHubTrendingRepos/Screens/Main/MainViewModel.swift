//
//  MainViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var showTrending = false
    let trendingViewModel: TrendingViewModel
    
    init(trendingViewModel: TrendingViewModel) {
        self.trendingViewModel = trendingViewModel
    }
}
