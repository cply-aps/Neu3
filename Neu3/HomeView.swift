//
//  HomeView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

import SwiftUI

struct HomeView: View, Hashable {
    var username: String
    
    var body: some View {
        VStack {
            Text("Welcome \(username) to the Home View!")
                .font(.largeTitle)
                .padding()
            
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(username: "Casper")
    }
}
