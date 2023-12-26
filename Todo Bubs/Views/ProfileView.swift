//
//  ProfileView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(self.userId)
                    .bold()
            }
            .navigationTitle("Baby's Profile")
        }
    }
}

#Preview {
    ProfileView(userId: "")
}
