//
//  ChangePassword.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 11/11/2024.
//

import SwiftUI


struct ChangePasswordView: View {
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
        }
    }
}


struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
