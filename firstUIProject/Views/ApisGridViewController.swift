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
            guard let url = URL(string: "https://reqres.in/api/users") else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching users: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedResponse.data
                        self.apiCollectionView.reloadData()
                    }
                } catch {
                    print("Decoding Error: \(error.localizedDescription)")
                }
            }.resume()
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

