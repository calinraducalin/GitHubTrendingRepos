//
//  TrendingReposDataClientPreview+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

final class TrendingReposDataClientPreview: TrendingReposDataClient & PreviewDataClient {
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository] { [.previewMicrosoft, .previewTldraw] }
}
