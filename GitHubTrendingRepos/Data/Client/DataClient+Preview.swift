//
//  DataClient+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

protocol TestDataClient: DataClient { }

extension TestDataClient {
    func getData(from: URL) async throws -> Data { .init() }
}
