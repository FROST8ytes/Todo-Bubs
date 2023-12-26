//
//  TodoListItemViewModel.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoItem) {
        #if DEBUG
        print("Toggling isDone...")
        #endif
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary(), merge: true)
    }
}
