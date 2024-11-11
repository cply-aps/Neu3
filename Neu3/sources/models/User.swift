//
//  User.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

struct User: Identifiable, Codable {
    var id = UUID().uuidString                // Matches "id" in the JSON
    let userName: String          // Matches "userName" in the JSON
    let normalizedUserName: String
    let email: String
    let normalizedEmail: String
    let emailConfirmed: Bool
    let passwordHash: String
    let securityStamp: String
    let concurrencyStamp: String
    let phoneNumber: String?
    let phoneNumberConfirmed: Bool
    let twoFactorEnabled: Bool
    let lockoutEnd: String?
    let lockoutEnabled: Bool
    let accessFailedCount: Int
}

struct LoginResponse: Decodable {
    var id = UUID().uuidString               // Matches "id" in the JSON
    let userName: String          // Matches "userName" in the JSON
    let normalizedUserName: String
    let email: String
    let normalizedEmail: String
    let emailConfirmed: Bool
    let passwordHash: String
    let securityStamp: String
    let concurrencyStamp: String
    let phoneNumber: String?
    let phoneNumberConfirmed: Bool
    let twoFactorEnabled: Bool
    let lockoutEnd: String?
    let lockoutEnabled: Bool
    let accessFailedCount: Int
}

