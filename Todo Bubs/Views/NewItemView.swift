//
//  NewItemView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
            Text("Bubs will remind you!")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 16)
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TextField("Comment", text: $viewModel.comment, axis: .vertical)
                    .lineLimit(5...10)
            }
            .padding(.horizontal, -16)
            Button {
                if viewModel.canSave {
                    viewModel.save()
                    isShowing = false
                } else {
                    viewModel.showAlert = true
                }
            } label: {
                Text("Save")
                    .foregroundStyle(Color.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(15.0)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in the title.")
                )
            }
        }
        .padding()
    }
}

#Preview {
    NewItemView(isShowing: Binding(get: { return true }, set: { _ in }))
}
