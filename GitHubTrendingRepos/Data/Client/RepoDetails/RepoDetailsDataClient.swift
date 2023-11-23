//
//  RepoDetailsDataClient.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

protocol RepoDetailsDataClient: DataClient {
    func fetchReadmeContent(repositoryPath: String) async throws -> String
}

extension URLSession: RepoDetailsDataClient {
    func fetchReadmeContent(repositoryPath: String) async throws -> String {
        let readmeURL = makeURL(endpoint: "/\(repositoryPath)/main/README.md", host: .github)
        do {
            let data = try await getData(from: readmeURL)
            return String(decoding: data, as: UTF8.self)
        } catch {
            throw DataError.readmeContent
        }
    }
}
