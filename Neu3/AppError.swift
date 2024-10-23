//
//  AppError.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

enum AppError: LocalizedError {
    case invalidCredentials
    case serverError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid username or password."
        case .serverError:
            return "Server is unreachable. Please try again later."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
