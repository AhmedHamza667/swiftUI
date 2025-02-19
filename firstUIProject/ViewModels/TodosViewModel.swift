//
//  TodosViewModel.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import Foundation

class TodosViewModel{
    var todos: [TodosItem] = []
    init(){
        loadTodos()
    }
    func loadTodos(){
        guard let url = Bundle.main.url(forResource: "Todos", withExtension: "json") else {
            print("File not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(TodoList.self, from: data)
            self.todos = decodedData.todos
        } catch {
            print(error.localizedDescription)
        }
    }
    func numberOfItems() -> Int {
        return todos.count
    }
    func getItem(at index: Int) -> TodosItem {
        return todos[index]
    }
}
