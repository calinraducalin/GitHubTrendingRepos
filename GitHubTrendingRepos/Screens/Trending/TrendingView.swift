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
            List(viewModel.repositories) { repository in
                Button(action: {
                    viewModel.selectedRepository = repository.item
                }, label: {
                    RepositoryCardView(repository: repository.item, periodFilter: repository.period)
                })
                .listRowBackground(Color(.systemGray2))
                .buttonStyle(ScaleButtonStyle())
            }
            .toolbar {
                PeriodFilterToolbar(selectedFilter: $viewModel.periodFilter)
            }
            .background(Color(.systemGray2))
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
