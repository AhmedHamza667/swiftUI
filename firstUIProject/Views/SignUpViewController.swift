//
//  SignUpViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/17/25.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var checkBoxImg: UIButton!
    var boxClicked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func checkBox(_ sender: Any) {
        boxClicked.toggle()
        let imageName = boxClicked ? "square" : "checkmark.square.fill"
        checkBoxImg.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func termsBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let termsViewController = storyboard.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
        self.navigationController?.present(termsViewController, animated: true)

}
    
}
