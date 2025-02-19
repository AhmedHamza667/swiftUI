//
//  TodosViewControllerTableViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import UIKit

class TodosTableViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    var viewModel = TodosViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        print(viewModel.todos[0])
    }
   
}

extension TodosTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "TodosTableViewCell", for: indexPath) as! TodosTableViewCell
        let item = viewModel.getItem(at: indexPath.row)
        listCell.userIdLabel.text = "\(item.userId)"
        listCell.toDoText.text = "\(item.todo)"
        listCell.completedCheck.image = item.completed ? UIImage(systemName: "checkmark") : UIImage(systemName: "xmark")
        listCell.completedCheck.tintColor = item.completed ? .green : .red
            return listCell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
