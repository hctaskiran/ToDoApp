//
//  ItemsListView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ListView: View {
    @StateObject var viewModel: ListViewViewModel
    @FirestoreQuery var items: [TodoListItemModel]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todolist")
        self._viewModel = StateObject(wrappedValue: ListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ItemListView(item: item)
                        .swipeActions{
                            Button("Delete", role: .destructive) {
                                viewModel.delete(id: item.id)
                            }
                        }
                }
            }
            .navigationTitle("Lists")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
                
            
        }
    }
}

#Preview {
    ListView(userId: "I4G3SyQ6l7gnoNmvp589LXqPP4Z2")
}
