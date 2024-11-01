//
//  User.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

struct User: Codable {
    let id: String
    let userName: String
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
    let lockoutEnd: String? // Or Date, depending on how it's returned
    let lockoutEnabled: Bool
    let accessFailedCount: Int
}

struct LoginResponse: Codable {
    let id: String
    let userName: String
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
