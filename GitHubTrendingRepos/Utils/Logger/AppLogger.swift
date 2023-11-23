//
//  AppLogger.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import OSLog

final class AppLogger {
    static let data = Logger(subsystem: subsystem, category: "Data")

    private static let subsystem: String = Bundle.main.bundleIdentifier ?? ""
}
