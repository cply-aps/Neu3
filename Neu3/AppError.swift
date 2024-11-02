//
//  AppError.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

enum AppError: LocalizedError {
    case invalidURL
    case invalidCredentials
    case serverError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL.", comment: "Invalid URL. label")
        case .invalidCredentials:
            return NSLocalizedString("Invalid username or password.", comment: "Invalid username or password label")
        case .serverError:
            return NSLocalizedString("Server is unreachable. Please try again later.", comment: "Server is unreachable label")
        case .unknownError:
            return NSLocalizedString("An unknown error occurred.", comment: "Unknown error label")
        }
    }
}
