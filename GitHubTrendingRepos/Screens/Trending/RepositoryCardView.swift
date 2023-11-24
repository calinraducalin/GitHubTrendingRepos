//
//  RepositoryCardView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 24.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RepositoryCardView: View {
    let repository: Repository
    let periodFilter: TrendingPeriodFilter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CardHeaderView(repository: repository)
            if let description = repository.description, !description.isEmpty {
                Text(description)
                    .font(.body)
            }
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

#Preview {
    RepositoryCardView(
        repository: .previewTldraw,
        periodFilter: .daily
    )
}
