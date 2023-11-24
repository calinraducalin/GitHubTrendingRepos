//
//  TrendingPeriodFilter.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 24.11.2023.
//

import Foundation

enum TrendingPeriodFilter: String, CaseIterable {
    case daily, weekly, monthly
}

extension TrendingPeriodFilter: Identifiable {
    var id: String { rawValue }
}

extension TrendingPeriodFilter {
    var title: String {
        switch self {
        case .daily:
            "Today"
        case .weekly:
            "This week"
        case .monthly:
            "This month"
        }
    }
}
