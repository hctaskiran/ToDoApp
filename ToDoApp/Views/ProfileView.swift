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
            VStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 120)
                    .overlay {
                        Circle().stroke(.green, lineWidth: 4)
                    }.shadow(radius: 10)
            }
            .navigationTitle("Profile")
            
        }
    }
}

#Preview {
    ProfileView()
}
