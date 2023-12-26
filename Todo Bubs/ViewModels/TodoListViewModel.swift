//
//  TodoListViewModel.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import FirebaseFirestore
import Foundation

class TodoListViewModel: ObservableObject {
    @Published var isShowingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete todo list item
    /// - Parameter item: todo item to delete
    func delete(item: TodoItem) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .delete()
    }
}
