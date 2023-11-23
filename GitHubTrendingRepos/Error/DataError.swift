//
//  DataError.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

enum DataError: Error, Equatable {
    case network
    case trendingRepos
    case readmeContent
}

extension DataError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network:
            return "A network error occured."
        case .trendingRepos:
            return "An error occured while fetching the trending repositories."
        case .readmeContent:
            return "An error occured while fetching the readme file content."
        }
    }
}
