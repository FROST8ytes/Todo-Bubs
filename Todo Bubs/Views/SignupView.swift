//
//  SignupView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct SignupView: View {
    @State var email = ""
    @State var password = ""
    
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
            
            // MARK: -Login Form
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email Address", text: $email)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .padding([.leading, .trailing, .bottom], 28)
            Button(action: {}) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(width: 100, height: 30)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            
            Spacer()
        }
        .background(LinearGradient(colors: [.yellow, .red], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SignupView()
}
