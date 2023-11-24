//
//  RepositoryDetailsViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import SwiftUI

@MainActor
final class RepositoryDetailsViewModel: ObservableObject {
    let repository: Repository
    @Published private(set) var readmeContent = ""
    private let dataClient: RepoDetailsDataClient
    
    init(dataClient: RepoDetailsDataClient = URLSession.shared, repository: Repository) {
        self.dataClient = dataClient
        self.repository = repository
    }
    
    func loadReadmeFile() async {
        do {
            let readmeContent = try await dataClient.fetchReadmeContent(repositoryPath: repository.path)
            withAnimation {
                self.readmeContent = readmeContent
            }
        } catch {
            AppLogger.data.error("failed to load readme file for: \(self.repository.path)")
        }

    }
}
