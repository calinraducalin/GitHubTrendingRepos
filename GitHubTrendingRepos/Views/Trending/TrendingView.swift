//
//  TrendingView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import SwiftUI

struct TrendingView: View {
    @StateObject var viewModel: TrendingViewModel
        
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray2)
                    .ignoresSafeArea()
                if !viewModel.repositories.isEmpty {
                    trendingList
                } else {
                    let (title, subtitle) = makeEmptyViewTexts(state: viewModel.state)
                    EmptyView(title: title, subtitle: subtitle)
                }
            }
            .toolbar {
                PeriodFilterToolbar(selectedFilter: $viewModel.periodFilter)
            }
            .listStyle(.plain)
            .navigationBarTitle("Trending Repos")
            .task {
                await viewModel.fetchTrendingRepos()
            }
            .refreshable {
                await viewModel.fetchTrendingRepos()
            }
            .sheet(item: $viewModel.selectedRepository) { repository in
                RepositoryDetailsView(viewModel: RepositoryDetailsViewModel(repository: repository))
            }
        }
    }
}

private extension TrendingView {
    var trendingList: some View {
        List(viewModel.repositories) { repository in
            Button(action: {
                viewModel.selectedRepository = repository.item
            }, label: {
                RepositoryCardView(repository: repository.item, periodFilter: repository.period)
            })
            .listRowBackground(Color(.systemGray2))
            .buttonStyle(ScaleButtonStyle())
        }
    }
    
    func makeEmptyViewTexts(state: ViewState) -> (title: String, subtitle: String) {
        let title: String
        let subtitle: String
        switch state {
        case .success:
            title = "No repository found. 😢"
            subtitle = "There is no trending repository to show at this time."
        case .loading:
            title = "Loading repositories... 👀"
            subtitle = "Your repositories will appear shortly."
        case .failure:
            title = "Oups... 🙈"
            subtitle = "Something went wrong while loading your repositories."
        }
        return (title, subtitle)
    }
}

private struct PeriodFilterToolbar: ToolbarContent {
    @Binding var selectedFilter: TrendingPeriodFilter
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Menu(content: {
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(TrendingPeriodFilter.allCases) {
                        Text($0.title)
                          .tag($0)
                    }
                }
            }, label: {
                HStack(spacing: 4) {
                    Text(selectedFilter.title)
                    Image(systemName: "chevron.down")
                        .imageScale(.medium)
                }
            })
        }
    }
}

#Preview {
    TrendingView(
        viewModel: TrendingViewModel(dataClient: TrendingReposDataClientPreview())
    )
}
