//
//  TestView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 01/11/2024.
//

import SwiftUI

struct TestView: View {
    var body: some View {

        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 0) {
                    Divider()
                        .frame(minHeight: 2)
                        .background(Color(.systemGray2))
                        .padding(.bottom, 40.0)
                    
                    NavigationLink(destination: DestinationView1()) {
                        MenuLineView(text: "Navigate to Page 1")
                    }
                    
                    NavigationLink(destination: DestinationView2()) {
                        MenuLineView(text: "Navigate to Page 2")
                    }
                    Spacer()
                }
            }
            .navigationTitle("Dagbog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //TODO: Create ProfileView and link to it here
                    } label: {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                        Text("Profil")
                            .textScale(.default)
                    }
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
