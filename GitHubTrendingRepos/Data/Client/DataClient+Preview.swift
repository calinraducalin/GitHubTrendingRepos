//
//  DataClient+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

protocol PreviewDataClient: DataClient { }

extension PreviewDataClient {
    func getData(from: URL) async throws -> Data { .init() }
}
