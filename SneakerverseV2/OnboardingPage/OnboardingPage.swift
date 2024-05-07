import SwiftUI

struct OnboardingPage<ViewModel>: View where ViewModel: OnboardingPageViewModel {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var router: RouterImpl
    
    var body: some View {
        NavigationStack(
            path: $router.navPath
        ) {
            VStack {
                TabView {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                buttonContainer
            }
            .padding()
            .task {
                await viewModel.loadContent()
            }
            .navigationDestination(for: String.self) { page in
                switch page {
                case "LoginPage":
                    LoginPage(viewModel: LoginPageViewModelImpl())
                case "SignupPage":
                    SignupPage(viewModel: SignupPageViewModelImpl())
                case "HomePage":
                    HomePage(viewModel: HomePageViewModelImpl())
                default:
                    Text("DefaultPage")
                }
            }
        }
    }
    
    private var buttonContainer: some View {
        VStack(spacing: Styleguide.Margin.medium) {
            SecondaryButton(
                title: "Sign up",
                color: .blue,
                action: {
                    router.pushView(view: .signupPage)
                }
            )
            PrimaryButton(
                title: "Login",
                color: .blue,
                action: {
                    router.pushView(view: .loginPage)
                }
            )
        }
    }
}

#Preview {
    OnboardingPage(
        viewModel: OnboardingPageViewModelImpl()
    )
}
