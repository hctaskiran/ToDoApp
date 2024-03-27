//
//  ItemListView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import SwiftUI

struct ItemListView: View {
    let item: TodoListItemModel
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueData).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                viewModel.isToggle(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.purple)
            }
        }
    }
}

#Preview {
    ItemListView(item: .init(id: "123", title: "Milk", dueData: Date().timeIntervalSince1970, createdDate:Date().timeIntervalSince1970 , isDone: false))
}
