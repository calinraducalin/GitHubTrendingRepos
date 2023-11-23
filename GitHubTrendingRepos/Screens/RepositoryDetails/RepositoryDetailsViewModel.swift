//
//  RepositoryDetailsViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import SwiftUI

@MainActor
final class RepositoryDetailsViewModel: ObservableObject {
    @Published private(set) var readmeContent = ""
    private(set) var repository: Repository = .previewMicrosoft
    private let dataClient: RepoDetailsDataClient
    
    init(dataClient: RepoDetailsDataClient = URLSession.shared) {
        self.dataClient = dataClient
    }
    
    func loadReadmeFile() async {
        do {
            let readmeContent = try await dataClient.fetchReadmeContent(repositoryPath: repository.path)
            withAnimation {
                self.readmeContent = readmeContent
            }
        } catch {
            print("handle error")
        }

    }
}
