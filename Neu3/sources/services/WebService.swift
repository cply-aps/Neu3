//
//  NetworkError.swift
//  Neu3
//
//  Created by Casper Lykke Andersen on 24/10/2024.
//

/**
import Foundation

enum NetworkError: Error {
    case badUrl
    case requestFailed
    case decodingError
}

class WebService {
    func loginUser(username: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        // Updated URL to https://localhost:8002/api/user/login
        guard let url = URL(string: "https://localhost:8002/api/user/login?username=\(username)&password=\(password)") else {
            completion(.failure(.badUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set up a custom URLSession with a delegate to bypass certificate validation
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: TrustingDelegate(), delegateQueue: nil)

        // Perform the request using the custom session
        session.dataTask(with: request) { data, response, error in
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

// Custom URLSessionDelegate that bypasses certificate validation
class TrustingDelegate: NSObject, URLSessionDelegate {
    // Override this method to bypass certificate validation
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // Accept any certificate without validation
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}

 */




import Foundation

enum NetworkError: Error {
    case badUrl
    case requestFailed
    case decodingError
}

class WebService {
    func loginUser(username: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        // Encode username and password to handle special characters
        guard let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedPassword = password.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(.badUrl))
            return
        }
        
        // Construct URL with query parameters
        guard let url = URL(string: "https://localhost:8002/api/user/login?username=\(encodedUsername)&password=\(encodedPassword)") else {
            completion(.failure(.badUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        // Empty body for the request, as required by the server
        request.httpBody = Data()

        // Custom session configuration with a trusting delegate
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: TrustingDelegate(), delegateQueue: nil)

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                completion(.failure(.requestFailed))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status code: \(httpResponse.statusCode)")
            }

            if let data = data, let responseBody = String(data: data, encoding: .utf8) {
                print("Response body: \(responseBody)")
            }

            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }

            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

// Custom URLSessionDelegate that bypasses certificate validation
class TrustingDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
           let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
