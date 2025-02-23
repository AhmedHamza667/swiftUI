//
//  GridViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/17/25.
//

import UIKit

class GridViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    var gridViewModel = GridViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
//        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        showPopUp()
    }
    
    func showPopUp() {
        let profileVC = CustomXIBProfile(nibName: "CustomXIBProfile", bundle: nil)
                profileVC.modalPresentationStyle = .overFullScreen
                present(profileVC, animated: true, completion: nil)

    }
}
extension GridViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        let item = gridViewModel.getItem(at: indexPath.item)
        cell.labelTitle.text = item.label
        cell.imgGridCell.image = UIImage(systemName: item.imageName)
        return cell
    }
    
    
}

