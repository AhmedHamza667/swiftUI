//
//  CustomXIBProfile.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/17/25.
//

import UIKit

class CustomXIBProfile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // fix this - go back to home
    @IBAction func logOutYes(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
