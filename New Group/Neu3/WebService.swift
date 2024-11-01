//
//  NetworkError.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//


import Foundation

enum NetworkError: Error {
    case badUrl
    case requestFailed
    case decodingError
}

class WebService {
    func loginUser(username: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "http://localhost:8002/api/User/login?username=\(username)&password=\(password)") else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
