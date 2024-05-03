import Foundation
import SwiftUI

protocol OnboardingPageViewModel: ObservableObject {
    var navigationPath: NavigationPath { get set }
    
    func loadContent() async
    func loginTapped()
    func signupTapped()
}

class OnboardingPageViewModelImpl: OnboardingPageViewModel {
    @Published var navigationPath: NavigationPath = NavigationPath()
    
    func loadContent() async {
        // TODO: add content
    }
    
    func loginTapped() {
        navigationPath.append("LoginPage")
    }
    
    func signupTapped() {
        navigationPath.append("SignupPage")
    }
}
