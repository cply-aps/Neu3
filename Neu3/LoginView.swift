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
            NavigationStack{
                ZStack{
                    Color.blue.opacity(0.2) // Adjust the color and opacity as needed
                            .edgesIgnoringSafeArea(.all) // Make sure the color fills the entire screen
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            Image("CP_Trold_Vaegt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
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
                            
                            // Forgotten password button
                            Button("Forgotten login credentials?") {
                                //TODO: Create "forgottenPassword" POST Method
                            }
                            Spacer()
                            
                            // Error message display
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                        .padding()
                        .navigationTitle("Login")
                        .navigationBarTitleDisplayMode(.inline)
                        .onTapGesture {
                            // Dismiss the keyboard when tapping outside the fields
                            focusedField = nil
                        }
                    }
                .onAppear {
                    focusedField = .username
                }
                // Watch for isLoggedIn to change the root view
                .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                    HomeView(username: viewModel.username)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView() // Display the LoginView in the preview
    }
}
