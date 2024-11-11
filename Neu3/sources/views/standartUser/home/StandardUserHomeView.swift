//
//  StandardUserHomeView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

import SwiftUI

struct StandardUserHomeView: View, Hashable {
    var body: some View {
        

            
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 0) {
                    Divider()
                        .frame(minHeight: 2)
                        .background(Color(.systemGray2))
                        .padding(.bottom, 40.0)
                    
                    NavigationLink(destination: CreateEntryView()) {
                        MenuLineView(text: NSLocalizedString("Create Entry", comment: "Create Entry label"))
                    }
                    
                    NavigationLink(destination: SeeAllEntriesView()) {
                        MenuLineView(text: NSLocalizedString("See All Entries", comment: "See diary entries label"))
                    }

                    NavigationLink(destination: CreateReportView()) {
                        MenuLineView(text: NSLocalizedString("Create Repport", comment: "Create report label"))
                    }
                    Spacer()
                }
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: StandardUserProfileView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                            Text("Profile")
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




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StandardUserHomeView()
    }
}
