//
//  TrendingViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import SwiftUI

@MainActor
final class TrendingViewModel: ObservableObject {
    let dataClient: TrendingReposDataClient
    
    @Published var periodFilter: TrendingPeriodFilter = .daily {
        didSet {
            withAnimation {
                repositories = []                
            }
            Task {
                await fetchTrendingRepos()
            }
        }
    }
    @Published var selectedRepository: Repository?
    @Published private(set) var repositories = [TrendingRepository]()
    @Published private(set) var state: ViewState = .success
        
    init(dataClient: TrendingReposDataClient = URLSession.shared) {
        self.dataClient = dataClient
    }
    
    func fetchTrendingRepos() async {
        state = .loading
        do {
            let repositories = try await dataClient.fetchTrendingRepos(periodfilter: periodFilter)
            let trendingRepositories = repositories.map {
                TrendingRepository(item: $0, period: periodFilter)
            }
            withAnimation {
                self.repositories = trendingRepositories
                state = .success
            }
        } catch {
            let dataError = error as? DataError ?? .unknown
            state = .failure(dataError)
        }
    }
    
}
