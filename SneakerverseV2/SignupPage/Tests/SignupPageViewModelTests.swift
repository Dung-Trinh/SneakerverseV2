import XCTest

class SignupPageViewModelTests: XCTest {
    var sut: SignupPageViewModelImpl!
    var router: RouterImpl!
    var loginAdapter: MockedLoginSignupNetworkAdapter!
    
    override func setUp() {
        super.setUp()
        loginAdapter = MockedLoginSignupNetworkAdapter()
        router = RouterImpl()
        
        sut = SignupPageViewModelImpl(loginAdapter: loginAdapter)
        sut.setupRouter(router)
    }
    
    override func tearDown() {
        sut = nil
        loginAdapter = nil
        router = nil
        
        super.tearDown()
    }
    
    func testDidTapSignup() async {
        await sut.didTapSignup()
        XCTAssertTrue(loginAdapter.createUserCalled)
    }
    
    func testDidTapLogin() async {
        XCTAssertEqual(router.navPath.count, 0)
        await sut.didTapLogin()
        XCTAssertEqual(router.navPath.count, 1)
        XCTAssertEqual(router.childViews.last, .loginPage)
    }
    
    func testHandleSignupWithGoogle() async {
        let vc = await UIViewController()
        await sut.handleSignupWithGoogle(viewController: vc)
    }
    
}
