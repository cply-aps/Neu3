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
        case userName
        case password
    }
    
    var body: some View {
            NavigationStack{
                ZStack{
                    Color.blue.opacity(0.2) // Adjust the color and opacity as needed
                            .edgesIgnoringSafeArea(.all) // Make sure the color fills the entire screen
                    
                        VStack(spacing: 20) {
                            Image("CP_Trold_Vaegt")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                            
                            TextField("Username", text: $viewModel.userName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .focused($focusedField, equals: .userName)
                                .submitLabel(.next)
                                .onSubmit {
                                    focusedField = .password
                                }
                            
                            SecureField("Password", text: $viewModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .focused($focusedField, equals: .password)
                                .submitLabel(.go)
                                .onSubmit {
                                    viewModel.login()
                                }
                            
                            Button("Forgotten password?") {
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
                .onAppear {
                    focusedField = .userName
                }
                // Watch for isLoggedIn to change the root view
                .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                    AdminUserHomeView()
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
