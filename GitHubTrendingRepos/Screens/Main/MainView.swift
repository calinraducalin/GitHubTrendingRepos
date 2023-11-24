//
//  MainView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel(trendingViewModel: TrendingViewModel())
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            if viewModel.showTrending {
                TrendingView(viewModel: viewModel.trendingViewModel)
            } else {
                WelcomeView(viewModel: .init(showTrending: $viewModel.showTrending))
            }
            
        }
    }
}

#Preview {
    MainView(
        viewModel: MainViewModel(
            trendingViewModel: TrendingViewModel(
                dataClient: TrendingReposDataClientPreview()
            )
        )
    )
}
