import Foundation
import SwiftUI

struct SignupPage<ViewModel>: View where ViewModel: SignupPageViewModel {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var router: RouterImpl
    
    var body: some View {
        VStack {
            PageHeader(
                title: "Create an account",
                subtitle: "Please enter your data."
            )
            VStack(spacing: Styleguide.Margin.medium) {
                emailInputField
                passwordInputField
                PrimaryButton(
                    title: "Sign up",
                    color: .blue,
                    action: {
                        Task {
                            await viewModel.didTapSignup()
                        }
                    }
                )
                HStack {
                    dividerLine
                    Text("OR").foregroundColor(.gray)
                    dividerLine
                }
                PrimaryButton(
                    title: "Sign up with Google",
                    color: .gray.opacity(0.8),
                    image: Image("googleLogo"),
                    action: {
                        Task {
                            await viewModel.handleSignupWithGoogle(viewController: getRootViewController())
                        }
                    }
                )
            }.padding(.bottom, Styleguide.Margin.medium)
            Spacer()
            HStack {
                Text("Already have an account?").foregroundColor(.gray)
                Button {
                    viewModel.didTapLogin()
                } label: {
                    Text("Log in").foregroundColor(.black)
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
    
    @ViewBuilder
    private var dividerLine: some View {
        VStack {
            Divider().background(.gray)
        }
    }
}

#Preview {
    SignupPage(
        viewModel: SignupPageViewModelImpl()
    )
}
