//
//  ListViewViewModel.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import Foundation
import FirebaseFirestore

class ListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String)  {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todolist")
            .document(id)
            .delete()
    }
}
