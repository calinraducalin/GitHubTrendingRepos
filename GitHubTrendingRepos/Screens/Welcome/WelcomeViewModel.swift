//
//  WelcomeViewModel.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 21.11.2023.
//

import UIKit

final class WelcomeViewModel: ObservableObject {
    
    func goToXapoAction() {
        openURL(with: "https://www.xapobank.com")
    }
    
    func primaryAction() {
        
    }
    
    func privacyAction() {
        openURL(with: "https://legal.xapobank.com/privacy/privacy-policy")
    }
    
    func termsAction() {
        openURL(with: "https://legal.xapobank.com/tos/bank")
    }
}

private extension WelcomeViewModel {
    
    func openURL(with string: String) {
        guard let url = URL(string: string) else { return }
        UIApplication.shared.open(url)
    }
}
