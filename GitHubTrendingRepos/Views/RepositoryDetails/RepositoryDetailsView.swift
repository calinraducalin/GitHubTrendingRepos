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
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RepositoryDetailsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                List {
                    listContent.listRowBackground(Color(.background))
                }
                .background(Color(.background))
                .listStyle(.grouped)
            }
            .navigationTitle(viewModel.repository.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(viewModel.repository.author)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                    })
                }
            }
            .task {
                await viewModel.loadReadmeFile()
            }
        }
        .navigationViewStyle(.stack)
    }
    
}

private extension RepositoryDetailsView {
    
    var listContent: some View {
        Group {
            HeaderView(repository: viewModel.repository)
            if let description = viewModel.repository.description, !description.isEmpty {
                Text(description)
                    .font(.body)
            }
            if !viewModel.readmeContent.isEmpty {
                Section("README.md") {
                    Markdown(viewModel.readmeContent)
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
    RepositoryDetailsView(viewModel: RepositoryDetailsViewModel(dataClient: RepoDetailsDataClientPreview(), repository: .previewTldraw))
}
