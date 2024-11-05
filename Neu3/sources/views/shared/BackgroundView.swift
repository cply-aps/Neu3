//
//  BackgroundView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 30/10/2024.
//

import SwiftUI

struct BackgroundView: View {
    
    var color: Color = .blue // You can make this configurable if needed
    var imageName: String = "CP_Trold_Vaegt" // Default image name
    
    var body: some View {
        ZStack {
            color.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .padding(60)
        }
    }
    
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
