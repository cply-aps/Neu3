//
//  LoginView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    
    enum Field {
        case username
        case password
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Username TextField
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .focused($focusedField, equals: .username)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .password
                }
            
            // Password SecureField
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .focused($focusedField, equals: .password)
                .submitLabel(.go)
                .onSubmit {
                    viewModel.login()
                }
            
            // Error message display
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Login")
        .onAppear {
            focusedField = .username
        }
        // Watch for isLoggedIn to change the root view
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            HomeView(username: viewModel.username)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView() // Display the LoginView in the preview
    }
}
