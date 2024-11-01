//
//  StandardUserProfileView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 01/11/2024.
//


import SwiftUI

struct StandardUserProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Page")
                .font(.largeTitle)
            
            Button(action: {
                // Log out by resetting the root view to LoginView
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.rootViewController = UIHostingController(rootView: LoginView())
                    window.makeKeyAndVisible()
                }
            }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding()
        }

    }
}


struct StandardUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StandardUserProfileView()
    }
}
