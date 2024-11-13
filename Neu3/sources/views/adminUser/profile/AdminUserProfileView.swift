//
//  AdminUserProfileView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 01/11/2024.
//


import SwiftUI

struct AdminUserProfileView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 0) {
                    Divider()
                        .frame(minHeight: 2)
                        .background(Color(.systemGray2))
                        .padding(.bottom, 40.0)
                    Spacer()
                    Button(action: {
                        // TODO: Make change password function and screen
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = windowScene.windows.first {
                            window.rootViewController = UIHostingController(rootView: ChangePasswordView())
                            window.makeKeyAndVisible()
                        }
                    }) {
                        Text("Change Password")
                            .padding()
                            .background(Color(.red))
                            .cornerRadius(10)
                            .foregroundColor(Color(.white))
                            .textScale(.default)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Log out by resetting the root view to LoginView
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = windowScene.windows.first {
                            window.rootViewController = UIHostingController(rootView: LoginView())
                            window.makeKeyAndVisible()
                        }
                    }) {
                        Text("Logout")
                            .textScale(.default)
                    }
                }
            }
            .toolbarBackground(Color.primary.opacity(0), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}


struct AdminUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AdminUserProfileView()
    }
}
