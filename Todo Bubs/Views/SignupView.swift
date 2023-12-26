//
//  SignupView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            // MARK: -Header
            Text("Todo Bubs")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(Color.white)
            Text("Let's join Bub's Cult!")
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
            
            // MARK: -Signup Form
            VStack(alignment: .leading, spacing: 15) {
                TextField("Full Name", text: $viewModel.name)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
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
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                CustomButtonView(label: "Sign Up", textColor: .white, buttonColor: .green, action: { viewModel.signup() })
            }
            .padding([.leading, .trailing])
            
            Spacer()
        }
        .background(LinearGradient(colors: [.yellow, .red], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SignupView()
}

