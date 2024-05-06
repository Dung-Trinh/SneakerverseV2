import Foundation
import XCTest

class LoginPageViewModelTests: XCTest {
    var sut: LoginPageViewModelImpl!
    var router: RouterImpl!
    var loginAdapter: MockedLoginSignupNetworkAdapter!
    
    override func setUp() {
        super.setUp()
        loginAdapter = MockedLoginSignupNetworkAdapter()
        router = RouterImpl()
        
        sut = LoginPageViewModelImpl(loginAdapter: loginAdapter)
        sut.setupRouter(router)
    }
    
    override func tearDown() {
        sut = nil
        loginAdapter = nil
        router = nil
        
        super.tearDown()
    }
    
    func testDidTappedLogin() async {
        await sut.didTappedLogin()
        XCTAssertTrue(loginAdapter.loginCalled)
    }
    
    func handleSignInButton() async {
        let vc = await UIViewController()
        await sut.handleSignInButton(viewController: vc)
        
        XCTAssertTrue(loginAdapter.loginWithGoogleCalled)
        XCTAssertEqual(router.navPath.count, 1)
        XCTAssertEqual(router.childViews.last, .homePage)
    }
}
