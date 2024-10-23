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
        NavigationView {
            VStack(spacing: 20) {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($focusedField, equals: .username) // Manage focus state
                    .submitLabel(.next) // Changes return button to "Next" for username field
                    .onSubmit {
                        // Move focus to the password field
                        focusedField = .password
                    }

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($focusedField, equals: .password) // Manage focus state
                    .submitLabel(.go) // Changes return button to "Go" for password field
                    .onSubmit {
                        // Trigger login when return is pressed
                        viewModel.login()
                    }

                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                // NavigationLink that triggers when isLoggedIn becomes true
                NavigationLink(
                    destination: HomeView(),
                    isActive: $viewModel.isLoggedIn
                ) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Login")
            .onAppear {
                // Automatically focus on the username field when the view appears
                focusedField = .username
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


