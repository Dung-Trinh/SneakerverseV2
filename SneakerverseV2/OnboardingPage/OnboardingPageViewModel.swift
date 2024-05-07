import Foundation
import SwiftUI

protocol OnboardingPageViewModel: ObservableObject {
    func loadContent() async
}

class OnboardingPageViewModelImpl: OnboardingPageViewModel {
    func loadContent() async {
        // TODO: add content
    }
}
