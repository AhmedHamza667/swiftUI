//
//  GridViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/17/25.
//

import UIKit

class GridViewController: UIViewController {
    let months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//    UIImage(systemName: "12.lane.ar")
    let images: [String] = ["1.lane.ar", "2.lane.ar", "3.lane.ar", "4.lane.ar", "5.lane.ar", "6.lane.ar", "7.lane.ar", "8.lane.ar", "9.lane.ar", "10.lane.ar", "11.lane.ar", "12.lane.ar"]
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        // Do any additional setup after loading the view.
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
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        cell.labelTitle.text = months[indexPath.item]
        cell.imgGridCell.image = UIImage(systemName: images[indexPath.item])
        return cell
    }
    
    
}

