//
//  WebViewController.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/17/25.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMyWebView()
    }
    func loadMyWebView(){
        if let url = URL(string: "https://www.google.com/"){
            let request = URLRequest(url: url)
            myWebView.load(request)

        }
 }

}
