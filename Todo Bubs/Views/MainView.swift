//
//  ContentView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TodoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
