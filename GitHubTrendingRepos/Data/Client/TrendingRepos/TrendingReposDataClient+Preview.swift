//
//  TrendingReposDataClientPreview+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

final class TrendingReposDataClientPreview: TrendingReposDataClient, TestDataClient {
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository] { [.previewTldraw, .previewSager] }
}
