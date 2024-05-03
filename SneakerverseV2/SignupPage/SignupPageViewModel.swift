import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

protocol SignupPageViewModel: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    
    func didTapSignup() async
    func didTapLogin()
    func handleSignupWithGoogle(viewController: UIViewController)
}

class SignupPageViewModelImpl: SignupPageViewModel {
    var email: String = ""
    var password: String = ""
    
    func didTapSignup() async {
        do {
            let response = try await Auth.auth().createUser(withEmail: email, password: password)
            print(response.user)
        } catch {
            // TODO: adding error handling
        }
    }
    
    func didTapLogin() {
        // TODO: implemeting navigation
    }
    
    func handleSignupWithGoogle(viewController: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            guard error == nil else {
                print(error?.localizedDescription)
                // ...
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // ...
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("authResult error: ", error.localizedDescription)
                }
                
                if authResult?.additionalUserInfo?.isNewUser == true {
                    // TODO: adding signup logic
                }
            }
        }
    }
}
