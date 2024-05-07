import SwiftUI

struct OnboardingPage<ViewModel>: View where ViewModel: OnboardingPageViewModel {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var router: RouterImpl
    
    var body: some View {
        NavigationStack(
            path: $router.navPath
        ) {
            Image("sneakerverseLogo")
            VStack(alignment: .center) {
                TabView {
                    CarouselView(viewModel: CarouselViewModelImpl(title: "Sneakers & Streetwear", subtitle: "Discover the latest news, trends and events ", image: Image("onboardingNews")))
                    CarouselView(viewModel: CarouselViewModelImpl(title: "Always up-to-date", subtitle: "the hottest sneaker releases directly on your phone", image: Image("onboardingUpToDate")))
                    CarouselView(viewModel: CarouselViewModelImpl(title: "Alerts", subtitle: "never miss a release thanks to alerts", image: Image("onboardingAlert")))
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
                color: Styleguide.PrimaryColor.purple,
                action: {
                    router.pushView(view: .signupPage)
                }
            )
            PrimaryButton(
                title: "Login",
                color: Styleguide.PrimaryColor.purple,
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
