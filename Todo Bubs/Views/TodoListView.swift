//
//  TodoListItemView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        let sortedItems = items.sorted(by: {$0.dueDate < $1.dueDate })
        NavigationView {
            VStack {
                List(sortedItems) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(item: item)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Baby's Todo List")
            .toolbar {
                Button {
                    viewModel.isShowingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingNewItemView, content: {
            NewItemView(isShowing: $viewModel.isShowingNewItemView)
        })
    }
}

#Preview {
    TodoListView(userId: "rbHYuqOzhXf81J7Vjn9i93a8p9H2")
}
