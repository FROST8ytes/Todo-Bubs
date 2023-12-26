//
//  TodoListItem.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 24/12/2023.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let comment: String
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
