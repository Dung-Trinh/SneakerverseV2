import SwiftUI
import _AuthenticationServices_SwiftUI
import FirebaseCore
import GoogleSignInSwift
import GoogleSignIn
import FirebaseAuth

struct LoginPage<ViewModel>: View where ViewModel: LoginPageViewModel {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            PageHeader(
                title: "Create an account",
                subtitle: "Please enter your data."
            )
            VStack(spacing: Styleguide.Margin.medium) {
                emailInputField
                passwordInputField
                if let errorMessage = viewModel.errorMessage {
                    withAnimation {
                        Text(errorMessage).foregroundColor(.red)
                    }
                }
                PrimaryButton(
                    title: "Login",
                    color: .blue,
                    action: {
                        Task {
                            await viewModel.didTappedLogin()
                        }
                    }
                )
                GoogleSignInButton(action: handleGoogleLogin)
            }
            
            Spacer()
            HStack {
                Text("Don't have an account?").foregroundColor(.gray)
                Button {
                    router.pushView(view: .signupPage)
                } label: {
                    Text("Sign up").foregroundColor(.black)
                }
            }
        }
        .padding()
        .onAppear{
            viewModel.setupRouter(router)
        }
    }
    
    @ViewBuilder
    private var emailInputField: some View {
        BasicInputField(
            input: $viewModel.email,
            title: "Email",
            placeholderText: "Email",
            iconName: "mail"
        )
    }
    
    @ViewBuilder
    private var passwordInputField: some View {
        BasicInputField(
            input: $viewModel.password,
            title: "Password",
            placeholderText: "Password",
            iconName: "lock",
            isSecurityField: true
        )
    }
    
    private func handleGoogleLogin() {
        Task {
            await viewModel.handleSignInButton(viewController: getRootViewController())
        }
    }
}

#Preview {
    LoginPage(
        viewModel: LoginPageViewModelImpl(loginAdapter: LoginSignupNetworkAdapterImpl())
    )
}
