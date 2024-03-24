//
//  LoginView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 23.03.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things ordered", angle: 15, bgColor: .purple)
                
                Form {
                    
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    CustomButtonView(text: "Log In", bgColor: .blue) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                VStack {
                    Text("Don't have an account?")
                    NavigationLink("Create a new one!", destination: RegisterView())
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
