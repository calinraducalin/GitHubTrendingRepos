//
//  TrendingRepository.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

struct TrendingRepository: Identifiable {
    let item: Repository
    let period: TrendingPeriodFilter
    
    var id: String { item.id }
}
