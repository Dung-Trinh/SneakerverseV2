import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct SneakerverseV2App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            OnboardingPage(viewModel: OnboardingPageViewModelImpl())
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .environmentObject(router)
        }
    }
}
