import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

protocol SignupPageViewModel: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    
    func didTapSignup() async
    func didTapLogin()
    func handleSignupWithGoogle(viewController: UIViewController) async
}

class SignupPageViewModelImpl: SignupPageViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let loginAdapter: LoginSignupNetworkAdapter
    
    init(loginAdapter: LoginSignupNetworkAdapter) {
        self.loginAdapter = loginAdapter
    }
    
    convenience init() {
        self.init(loginAdapter: LoginSignupNetworkAdapterImpl())
    }
    
    func didTapSignup() async {
        do {
            let response = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )
            print(response.user)
        } catch {
            // TODO: adding error handling
        }
    }
    
    func didTapLogin() {
        // TODO: implemeting navigation
    }
    
    func handleSignupWithGoogle(viewController: UIViewController) async {
        do {
            try await loginAdapter.signupWithGoogle(viewController: viewController)
        } catch let err{
            print(err.localizedDescription)
        }
    }
}
