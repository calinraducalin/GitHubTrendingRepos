//
//  WelcomeView.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 21.11.2023.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var viewModel: WelcomeViewModel
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack {
                HeaderView(action: viewModel.goToXapoAction)
                ContentView()
                FooterView(
                    primaryAction: viewModel.primaryAction,
                    privacyAction: viewModel.privacyAction,
                    termsAction: viewModel.termsAction
                )
            }
            .padding(16)
        }
    }
}

private struct HeaderView: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(
                action: action,
                label: {
                    Text("Go to Xapo")
                }
            )
            .foregroundColor(.white)
        }
    }
}

private struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    Image(.xapoLogo)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Welcome to iOS Test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("iOS Test for Xapo bank")
                        .font(.callout)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
                        .font(.callout)
                }
                .multilineTextAlignment(.center)
                .padding(32)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)

            }
        }
    }
}

private struct FooterView: View {
    let primaryAction: () -> Void
    let privacyAction: () -> Void
    let termsAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            CallToActionButton(text: "Enter the app", action: primaryAction)
            PrivacyTermsView(privacyAction: privacyAction, termsAction: termsAction)
        }
        .padding(.top, 16)
    }
}

private struct PrivacyTermsView: View {
    let privacyAction: () -> Void
    let termsAction: () -> Void
    
    var body: some View {
        HStack(spacing: .zero) {
            UnderlineButton(text: "Privacy Policy", action: privacyAction)
            Text(" " + "and" + " ")
            UnderlineButton(text: "Terms of use", action: termsAction)
        }
        .font(.footnote)
        .opacity(0.75)
    }
}

#Preview {
    WelcomeView(viewModel: .init(showTrending: .constant(false)))
}
