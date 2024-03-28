//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 50){
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125, height: 120)
            .overlay {
                Circle().stroke(.green, lineWidth: 4)
            }.shadow(radius: 10)
            .padding()
        
        VStack(alignment: .leading, spacing: 40) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        Button("Log Out", role: .destructive) {
            viewModel.logOut()
        }.padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
