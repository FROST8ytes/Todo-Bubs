//
//  SignupViewModel.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignupViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errMsg = ""
    
    init() {}
    
    func signup() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errMsg = ""
        
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
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
