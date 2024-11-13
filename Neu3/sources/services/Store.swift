//
//  Store.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 12/11/2024.
//

import Foundation

class Store: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        loadUsers()
    }
    
    //TODO: Try make this a generic class
    //MARK: - CRUD Functions
    // CREATE
    func create(_ newUser: User) {
        users.append(newUser)
        saveUsers()
    }
    
    // READ
    func loadUsers() {
        //TODO: change this to the API call
        guard let data = try? FileManager().readDocument(docName: User.fileName) else { return }
        guard let contacts = try? JSONDecoder().decode([User].self, from: data) else { return }
        self.users = users
    }
    
    // UPDATE
    func update(_ user: User) {
        guard let index = users.firstIndex(where: { $0.id == user.id}) else { return }
        users[index] = user
        saveUsers()
    }
    
    // DELETE
    func delete(at indexSet: IndexSet) {
        users.remove(atOffsets: indexSet)
        saveUsers()
    }
    
    //Save
    func saveUsers() {
        // Encode and replace file in the application document directory
        guard let data = try? JSONEncoder().encode(users) else { return }
        let jsonString = String(decoding: data, as: UTF8.self)
        try? FileManager().saveDocument(contents: jsonString, docName: User.fileName)
    }
}
