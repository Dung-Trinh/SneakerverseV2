import Foundation
import SwiftUI

enum DestinationView: String {
    case loginPage = "LoginPage"
    case signupPage = "SignupPage"
    case homePage = "HomePage"
}

final class Router: ObservableObject {
    @Published var navPath: NavigationPath = .init()
    
    func pushView(view: DestinationView){
        navPath.append(view.rawValue)
    }
}

protocol OnboardingPageViewModel: ObservableObject {
    func loadContent() async
}

class OnboardingPageViewModelImpl: OnboardingPageViewModel {
    func loadContent() async {
        // TODO: add content
    }
}
