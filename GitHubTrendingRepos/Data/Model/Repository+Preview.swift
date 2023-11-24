//
//  Repository+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

extension Repository {
    static let previewTldraw = Repository(
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
}
