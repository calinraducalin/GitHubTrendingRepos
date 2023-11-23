//
//  TrendingView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import SDWebImageSwiftUI
import SwiftUI

struct TrendingView: View {
    @StateObject var viewModel = TrendingViewModel()
        
    var body: some View {
        NavigationView {
            List(viewModel.repositories) { repository in
                Button(action: {}) {
                    CardView(repository: repository, periodFilter: viewModel.periodFilter)
                }
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

private struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        withAnimation {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)

        }
    }
}

private struct CardView: View {
    let repository: Repository
    let periodFilter: TrendingPeriodFilter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CardHeaderView(repository: repository)
            Text(repository.description ?? "")
                .font(.body)
            CardFooterView(repository: repository, periodFilter: periodFilter)
        }
        .padding(16)
        .background(Color.background)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.4), radius: 5)
    }
}

private struct CardHeaderView: View {
    let repository: Repository
    
    var body: some View {
        HStack {
            WebImage(url: repository.avatar)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .clipped()
            .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 5) {
                Text(repository.author)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                Text(repository.name)
                    .font(.title3)
            }
            
            Spacer()
        }
    }
}

private struct CardFooterView: View {
    private enum Constants {
        static let horizontalSpacing: CGFloat = 4
    }
    let repository: Repository
    let periodFilter: TrendingPeriodFilter
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: Constants.horizontalSpacing) {
                Image(systemName: "star")
                Text(starsText)
            }
            .font(.headline)
            .foregroundColor(.secondary)
            
            HStack(spacing: Constants.horizontalSpacing) {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color(hex: repository.languageColor ?? ""))
                Text(repository.language ?? "")
                    .foregroundColor(.secondary)
            }
            .font(.headline)
        }
    }
    
    private var starsText: String {
        guard let stars = repository.currentPeriodStars else { return "" }
        return "\(stars) \(periodFilter.title.lowercased())"
    }
}

private extension TrendingPeriodFilter {
    var title: String {
        switch self {
        case .daily:
            "Today"
        case .weekly:
            "This week"
        case .monthly:
            "This month"
        }
    }
}

#Preview {
    TrendingView(
        viewModel: TrendingViewModel(dataClient: TrendingReposDataClientPreview())
    )
}
