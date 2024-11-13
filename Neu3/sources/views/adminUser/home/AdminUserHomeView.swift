//
//  AdminUserHomeView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 11/11/2024.
//

import SwiftUI

struct AdminUserHomeView: View, Hashable {
    var body: some View {
        

            
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 0) {
                    Divider()
                        .frame(minHeight: 2)
                        .background(Color(.systemGray2))
                        .padding(.bottom, 40.0)
                    
                    UserFilterView()
                    Spacer()
                    
                    // NavigationLink to navigate to CreateUserView
                    NavigationLink(destination: CreateUserView()) {
                        Text("Create user")
                            .padding(.bottom, 100)
                            .textScale(.default)
                    }
                }
            }
            .navigationTitle("Home")
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




struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminUserHomeView()
    }
}
