//
//  AccountView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 24.03.2024.
//

import Foundation
import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        TabView {
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
