//
//  Repository.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

struct Repository: Codable {
    let author: String
    let name: String
    let avatar: URL?
    let description: String?
    let language: String?
    let languageColor: String?
    let currentPeriodStars: Int?
    let stars: Int?
    let forks: Int?
}

extension Repository: Identifiable {
    var id: String { path }
    var path: String { "\(author)/\(name)" }
}
