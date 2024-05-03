import Foundation
import SwiftUI

struct SignupPage<ViewModel>: View where ViewModel: SignupPageViewModel {
    @StateObject var viewModel: ViewModel
    
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
                    title: "Sign Up",
                    color: .green,
                    action: {
                        Task {
                            await viewModel.didTapSignup()
                        }
                    }
                )
            }.padding(.bottom, Styleguide.Margin.extraLarge)
            HStack {
                dividerLine
                Text("OR").foregroundColor(.gray)
                dividerLine
            }.padding(.bottom, Styleguide.Margin.medium)
            PrimaryButton(
                title: "Sign up with Google",
                color: .blue.opacity(0.8),
                image: Image("googleLogo"),
                action: {
                    viewModel.handleSignupWithGoogle(viewController: getRootViewController())
                }
            )
            Spacer()
            HStack {
                Text("Already have an account?").foregroundColor(.gray)
                Button {
                    viewModel.didTapLogin()
                } label: {
                    Text("Log in").foregroundColor(.black)
                }
            }
        }.padding()
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
