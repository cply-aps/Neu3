//
//  HomeView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var user = User()
    
    var body: some View {
        Text("Welcome \(user.username) to the Home View!")
            .font(.largeTitle)
            .padding()
    }
}
