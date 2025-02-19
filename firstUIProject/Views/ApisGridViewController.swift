//
//  ApisGridViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import UIKit

private let reuseIdentifier = "Cell"


class ApisGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

 
    @IBOutlet weak var apiCollectionView: UICollectionView!
    
    
    var users: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        apiCollectionView.dataSource = self
        apiCollectionView.delegate = self
        fetchUsers()
    }


    func fetchUsers() {
            NetworkManager.shared.fetchUsers { result in
                switch result {
                case .success(let users):
                    self.users = users
                    self.apiCollectionView.reloadData()
                case .failure(let error):
                    print("Error fetching users: \(error.localizedDescription)")
                }
            }
        }
    }

extension ApisGridViewController: UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
    
        // Configure the cell
        let user = users[indexPath.item]
        cell.config(with: user)
    
        return cell
    }

    
}

