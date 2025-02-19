//
//  TodosTableViewCell.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import UIKit

class TodosTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var toDoText: UILabel!
    
    @IBOutlet weak var completedCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
