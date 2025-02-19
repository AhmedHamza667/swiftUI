//
//  Users.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import Foundation

struct UsersResponse: Codable {
    let data: [User]
}

struct User: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
