//
//  LoginViewModel.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errMsg = "Please fill in all fields."
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        guard emailPred.evaluate(with: email) else {
            errMsg = "Please enter valid email."
            return false
        }
        return true
    }
}
