//
//  CreateUserView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 12/11/2024.
//

import SwiftUI

struct CreateUserView: View, Hashable {
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    FormView()
                        .padding(.top, 100) //TODO: change padding
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all) // Ensures BackgroundView fills the whole screen
            .navigationTitle("Create User")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AdminUserProfileView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                            Text("Admin")
                                .textScale(.default)
                        }
                    }
                }
            }
            .toolbarBackground(Color.primary.opacity(0), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}




struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
