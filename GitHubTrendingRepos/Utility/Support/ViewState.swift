//
//  ViewState.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 24.11.2023.
//

import Foundation

enum ViewState: Equatable {
    case success
    case loading
    case failure(_ error: DataError)
}
