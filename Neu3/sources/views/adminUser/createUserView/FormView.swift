//
//  FormView.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 12/11/2024.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var store: Store
    @StateObject var viewModel = CreateUserViewModel()
    @FocusState private var focusedField: Field?
    
    enum Field {
        case userName
        case password
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Username TextField
                TextField("Username", text: $viewModel.userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($focusedField, equals: .userName)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                
                // Password SecureField
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($focusedField, equals: .password)
                    .submitLabel(.go)
                    .onSubmit {
                        // TODO: what happens on submit
                    }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: CreateUserViewModel())
    }
}
