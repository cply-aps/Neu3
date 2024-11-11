//
//  LoginViewModel.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

/**
 import Foundation
 import Combine
 
 class LoginViewModel: ObservableObject {
 @Published var username: String = ""
 @Published var password: String = ""
 @Published var errorMessage: String = ""
 @Published var isLoggedIn: Bool = false
 
 private var cancellables = Set<AnyCancellable>()
 private let webService = WebService()
 
 func login() {
 webService.loginUser(username: username, password: password) { [weak self] result in
 DispatchQueue.main.async {
 switch result {
 case .success(_):
 // Log in the user regardless of email confirmation
 self?.isLoggedIn = true
 
 case .failure(let error):
 self?.handleError(error)
 }
 }
 }
 }
 
 private func handleError(_ error: NetworkError) {
 switch error {
 case .badUrl:
 errorMessage = AppError.invalidURL.errorDescription ?? "Invalid URL."
 case .requestFailed:
 errorMessage = AppError.serverError.errorDescription ?? "Request failed. Please check your internet connection."
 case .decodingError:
 errorMessage = AppError.invalidCredentials.errorDescription ?? "Wrong username or password. Please try again."
 }
 }
 }
 */

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoggedIn: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let webService = WebService()
    
    func login() {
        
        webService.loginUser(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    // Log in the user regardless of email confirmation
                    self?.isLoggedIn = true
                    
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: NetworkError) {
        switch error {
        case .badUrl:
            errorMessage = AppError.invalidURL.errorDescription ?? "Invalid URL."
        case .requestFailed:
            errorMessage = AppError.serverError.errorDescription ?? "Request failed. Please check your internet connection."
        case .decodingError:
            errorMessage = AppError.invalidCredentials.errorDescription ?? "Wrong username or password. Please try again."
        }
    }
}
