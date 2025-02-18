//
//  ViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/13/25.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    

    @IBAction func resetPassBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resetPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)

    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)

    }
    func validEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return email.range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    func validPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        let email = textFieldEmail.text ?? ""
        let password = textFieldPass.text ?? ""
        let alert = UIAlertController(title: "Error", message: "Email or password is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                if validEmail(email) && validPassword(password){
                    print("Succed")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let gridViewController = storyboard.instantiateViewController(withIdentifier: "GridViewController") as? GridViewController {
                        self.navigationController?.pushViewController(gridViewController, animated: true)
                    }
        }
        else {
            self.present(alert, animated: true)
        }
    }
    
    }

