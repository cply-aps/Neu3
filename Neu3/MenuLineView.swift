//
//  TestView 2.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 01/11/2024.
//


import SwiftUI

struct LineView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.8))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}


struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(text: "Some text")
    }
}
