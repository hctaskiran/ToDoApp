//
//  ContentView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            AccountView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}

