//
//  TodosItems.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import Foundation

struct TodoList: Codable {
    let todos: [TodosItem]
}


struct TodosItem: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

