import UIKit

class MockedLoginSignupNetworkAdapter: LoginSignupNetworkAdapter {
    var loginCalled = false
    var loginWithGoogleCalled = false
    var signupWithGoogleCalled = false
    var createUserCalled = false
    
    func login(email: String, password: String) async throws {
        loginCalled = true
    }
    
    func loginWithGoogle(viewController: UIViewController) async throws {
        loginWithGoogleCalled = true
    }
    
    func signupWithGoogle(viewController: UIViewController) async throws {
        signupWithGoogleCalled = true
    }
    
    func createUser(email: String, password: String) async throws {
        createUserCalled = true
    }
}
