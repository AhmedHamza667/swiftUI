//
//  NetworkManager.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/19/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager() // Singleton
    
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: APIEndpoints.baseURL+APIEndpoints.users) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse.data))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: APIEndpoints.baseURL+APIEndpoints.login) else {
                    completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                    return
                }

        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    completion(.failure(error))
                    return
                }
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    guard let data = data else {
                        completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                        return
                    }
                    
                    do {
                        let responseDict = try JSONDecoder().decode([String: String].self, from: data)
                        if let token = responseDict["token"] {
                            DispatchQueue.main.async {
                                completion(.success(token))
                            }
                        } else {
                            completion(.failure(NSError(domain: "Invalid Response", code: -1, userInfo: nil)))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
            }
}
