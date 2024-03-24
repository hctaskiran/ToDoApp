//
//  NewItemViewViewModel.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current uid
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = TodoListItemModel(id: newId,
                                        title: title,
                                        dueData: dueDate.timeIntervalSince1970,
                                        createdDate: Date().timeIntervalSince1970,
                                        isDone: false)
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todolist")
            .document(newId)
            .setData(newItem.castDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
