//
//  TrendingReposDataClient.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

protocol TrendingReposDataClient: DataClient {
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository]
}

extension URLSession: TrendingReposDataClient {
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository] {
        let sinceQuery = URLQueryItem(name: "since", value: periodfilter.rawValue)
        let repositoriesURL = makeURL(endpoint: "/repositories", queryItems: [sinceQuery])
        let data = try await getData(from: repositoriesURL)
        do {
            let decoder = makeDecoder()
            let repositories = try decoder.decode([Repository].self, from: data)
            logger?.debug("Received repositories: \(repositories.count)")
            return repositories
        } catch {
            throw DataError.trendingRepos
        }
    }
}
