//
//  RepositoryDetailsView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import MarkdownUI
import SDWebImageSwiftUI
import SwiftUI

struct RepositoryDetailsView: View {
    @StateObject var viewModel: RepositoryDetailsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                List {
                    HeaderView(repository: viewModel.repository)
                        .listRowBackground(Color(.background))
                    Text(viewModel.repository.description ?? "")
                        .font(.body)
                        .listRowBackground(Color(.background))

                    Section("README.md") {
                        Markdown(viewModel.readmeContent)
                            .listRowBackground(Color(.background))                        
                    }
                }
                .background(Color(.background))
                .listStyle(.grouped)
            }
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadReadmeFile()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(viewModel.repository.author)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                ToolbarItem(placement: .principal) {
                    Text(viewModel.repository.name)
                        .font(.headline)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                    }
                }
            }
        }
    }

}

private struct HeaderView: View {
    private enum Constants {
        static let verticalSpacing: CGFloat = 8
    }
    let repository: Repository
    
    var body: some View {
        HStack(spacing: 20) {
            WebImage(url: repository.avatar)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .clipped()
            .frame(width: 100, height: 100)

            VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(hex: repository.languageColor ?? ""))
                    Text(repository.language ?? "")
                        .foregroundColor(.secondary)
                }
                .font(.headline)
                
                VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                    HStack {
                        Image(systemName: "star")
                        Text(repository.stars?.description ?? "")
                    }
                    HStack {
                        Image(systemName: "tuningfork")
                        Text(repository.forks?.description ?? "")
                    }
                }
                .font(.headline)
                .foregroundColor(.secondary)

            }
            
            Spacer()
        }
    }
}

#Preview {
    RepositoryDetailsView(viewModel: RepositoryDetailsViewModel(dataClient: RepoDetailsDataClientPreview()))
}
