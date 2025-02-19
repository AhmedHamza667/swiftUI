//
//  UserCollectionViewCell.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import UIKit



class UserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func config(with user: User){
        nameLabel.text = "\(user.first_name) \(user.last_name)"
        emailLabel.text = "\(user.email)"
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width / 2
        avatarImg.clipsToBounds = true

        if let url = URL(string: user.avatar){
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.avatarImg.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
