//
//  TrendingViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import UIKit

@MainActor
final class TrendingViewModel: ObservableObject {
    let dataClient: TrendingReposDataClient
    
    @Published var periodFilter: TrendingPeriodFilter = .daily {
        didSet {
            repositories = []
            Task {
                await fetchTrendingRepos()
            }
        }
    }
    @Published private(set) var repositories = [Repository]()
        
    init(dataClient: TrendingReposDataClient = URLSession.shared) {
        self.dataClient = dataClient
    }
    
    func fetchTrendingRepos() async {
        do {
            repositories = try await dataClient.fetchTrendingRepos(periodfilter: periodFilter)
        } catch {
            print("handle error")
        }
    }
    
}
