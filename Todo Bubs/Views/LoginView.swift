//
//  LoginView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // MARK: -Header
                Text("Todo Bubs")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                Text("Bubs always reminds you :D")
                    .font(.subheadline)
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 40)
                
                if !viewModel.errMsg.isEmpty {
                    Text(viewModel.errMsg)
                        .padding(15)
                        .foregroundStyle(Color.white)
                        .background(Color.red)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .frame(height: 30)
                        .padding(.bottom)
                }
                
                // MARK: -Login Form
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    CustomButtonView(label: "Sign In", textColor: .white, buttonColor: .green, action: { viewModel.login() })
                }
                .padding([.leading, .trailing])
                
                Spacer()
                
                // MARK: -Signup Button
                VStack {
                    Text("New around here?").foregroundStyle(Color.white)
                    NavigationLink("Sign Up", destination: SignupView())
                        .foregroundStyle(Color.teal)
                }
                .padding(.bottom, 25.0)
            }
            .background(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    LoginView()
}
