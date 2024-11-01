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
                        MenuLineView(text: "Opret indlæg")
                    }
                    
                    NavigationLink(destination: SeeAllEntriesView()) {
                        MenuLineView(text: "Se dagbogs indlæg")
                    }
                    
                    NavigationLink(destination: CreateReportView()) {
                        MenuLineView(text: "Opret rapport")
                    }
                    Spacer()
                }
            }
            .navigationTitle("Dagbog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: CreateEntryView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                            Text("Profil")
                                .textScale(.default)
                        }
                    }
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StandardUserHomeView()
    }
}
