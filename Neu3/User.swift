//
//  User.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

struct User: Codable {
    let userName: String
    let passwordHash: String
}

struct LoginResponse: Codable {
    let userName: String
    let passwordHash: String
}
