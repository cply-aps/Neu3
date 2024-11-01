//
//  TestView 2.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 01/11/2024.
//


import SwiftUI

struct MenuLineView: View {
    let text: String
    
    var body: some View {
        

        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(text)
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding(.vertical, 15)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.forward")
                    .padding(.trailing, 20)
                    .foregroundColor(Color(.systemGray2))
            }
            .background(Color.white.opacity(0.8))
            
            Divider()
                .frame(height: 1.0)
                .background(Color.black.opacity(0.5))
                .padding(.leading, 20)
        }
    }
}


struct MenuLineView_Previews: PreviewProvider {
    static var previews: some View {
        MenuLineView(text: "Some text")
    }
}
