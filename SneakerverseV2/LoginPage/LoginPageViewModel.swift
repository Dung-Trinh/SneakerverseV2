import Foundation
import SwiftUI
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

protocol LoginPageViewModel: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var errorMessage: String? { get }
    
    func setupRouter(_ router: Router)
    func didTappedLogin() async
    func handleSignInButton(viewController: UIViewController) async
}

class LoginPageViewModelImpl: LoginPageViewModel {
    @Published var email = "duuung1998+1@gmail.com"
    @Published var password = ""
    @Published var errorMessage: String?
    
    private let loginAdapter: LoginSignupNetworkAdapter
    private var router: Router?
    
    init(loginAdapter: LoginSignupNetworkAdapter) {
        self.loginAdapter = loginAdapter
    }
    
    convenience init() {
        self.init(loginAdapter: LoginSignupNetworkAdapterImpl())
    }
    
    @MainActor func didTappedLogin() async {
        validateInput()
        
        do {
            try await loginAdapter.login(email: email, password: password)
        } catch let err {
            print(err)
            errorMessage = err.localizedDescription
        }
    }
    
    func handleSignInButton(viewController: UIViewController) async {
        do {
            try await loginAdapter.loginWithGoogle(viewController: viewController)
            router?.pushView(view: .homePage)
        } catch {
            // TODO: error handling
        }
    }
    
    func setupRouter(_ router: Router) {
        self.router = router
    }
    
    private func validateInput() {
        // TODO: add email and password validation
    }
}
