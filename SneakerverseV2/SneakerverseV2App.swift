import SwiftUI

@main
struct SneakerverseV2App: App {
    var body: some Scene {
        WindowGroup {
            OnboardingPage(viewModel: OnboardingPageViewModelImpl())
        }
    }
}
