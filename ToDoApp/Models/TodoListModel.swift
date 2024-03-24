//
//  TodoListModel.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import Foundation

struct TodoListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueData: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func toggleDone(_ state: Bool) {
        isDone = state
    }
}
