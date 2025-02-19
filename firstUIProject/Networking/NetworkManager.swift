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
        guard let url = URL(string: "https://reqres.in/api/users") else {
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
}
