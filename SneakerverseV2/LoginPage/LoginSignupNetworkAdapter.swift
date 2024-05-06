import Foundation
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

enum SignupError: Error {
    case userAlreadyExist(String)
}

protocol LoginSignupNetworkAdapter {
    func login(email: String, password: String) async throws
    func loginWithGoogle(viewController: UIViewController) async throws
    func signupWithGoogle(viewController: UIViewController) async throws
    func createUser(email: String, password: String) async throws
}

class LoginSignupNetworkAdapterImpl: LoginSignupNetworkAdapter {
    func signupWithGoogle(viewController: UIViewController) async throws {
        let result = try await handleGoogleCredentials(viewController: viewController)
        if result?.additionalUserInfo?.isNewUser == false {
            throw SignupError.userAlreadyExist("userAlreadyExist")
            // TODO: handling registered accounts
        }
    }
    
    func loginWithGoogle(viewController: UIViewController) async throws {
        _ = try await handleGoogleCredentials(viewController: viewController)
    }
    
    func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func handleGoogleCredentials(viewController: UIViewController) async throws -> AuthDataResult? {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return nil }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
        
        guard let idToken = result.user.idToken?.tokenString else { return nil }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: result.user.accessToken.tokenString
        )
        
        let authResult = try await Auth.auth().signIn(with: credential)
        return authResult
    }
    
    func createUser(email: String, password: String) async throws {
        try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
    }
}
