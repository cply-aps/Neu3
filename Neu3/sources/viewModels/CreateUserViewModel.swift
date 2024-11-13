//
//  CreateUserViewModel.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 12/11/2024.
//

import Foundation

class CreateUserViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    @Published var userType = ""
    
    var id: String?
    
    var updating: Bool { id != nil }
    
    init() {}
    
    init(_ user:User) {
        userName = user.userName
        password = user.passwordHash //TODO: get a password in the API call
        id = user.id
    }
    
    var incomplete: Bool {
        userName.isEmpty || password.isEmpty
    }
}
