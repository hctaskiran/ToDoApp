//
//  ProfileViewViewModel.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class ProfileViewViewModel: ObservableObject {
    
    init() {
        
    }
    
    func isToggle(item: TodoListItemModel) {
         var newItem = item
        newItem.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db
            .collection("users")
            .document(uid)
            .collection("todolist")
            .document(newItem.id)
            .setData(newItem.castDictionary())
    }
}
