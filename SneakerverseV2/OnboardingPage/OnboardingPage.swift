import SwiftUI

struct OnboardingPage<ViewModel>: View where ViewModel: OnboardingPageViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack(
            path: $viewModel.navigationPath
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
                    EmptyView()
                case "SignupPage":
                    SignupPage(viewModel: SignupPageViewModelImpl())
                default:
                    EmptyView()
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
                    viewModel.signupTapped()
                }
            )
            PrimaryButton(
                title: "Login",
                color: .blue,
                action: {
                    viewModel.loginTapped()
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
