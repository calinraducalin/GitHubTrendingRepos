//
//  TrendingReposDataClientPreview+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

final class TrendingReposDataClientPreview: TrendingReposDataClient & PreviewDataClient {
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository] { previewTrendingRepos }
}

private let previewTrendingRepos: [Repository] = [
    Repository(
        author: "microsoft",
        name: "ML-For-Beginners",
        avatar: URL(string: "https://github.com/microsoft.png"),
        description: "12 weeks, 26 lessons, 52 quizzes, classic Machine Learning for all",
        language: "HTML",
        languageColor: "#e34c26",
        currentPeriodStars: 6246,
        stars: 60244,
        forks: 12106
    ),
    Repository(
        author: "tldraw",
        name: "tldraw",
        avatar: URL(string: "https://github.com/tldraw.png"),
        description: "a very good whiteboard",
        language: "TypeScript",
        languageColor: "#3178c6",
        currentPeriodStars: 3968,
        stars: 26065,
        forks: 1434
    )
]
