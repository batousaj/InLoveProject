//
//  HomeViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 11/12/2021.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    var welcome:UILabel!
    @IBOutlet weak var backBut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
    }
    
    func setupElement() {
        welcome = UILabel.init(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        welcome.center = self.view.center
        welcome.text = "Welcome"
        welcome.font = .boldSystemFont(ofSize: 30)
        welcome.textColor = .black
        self.view.addSubview(welcome)
        
        backBut.layer.borderWidth = 1.0
        backBut.layer.borderColor = UIColor.systemBlue.cgColor
        
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        
        self.view.window?.rootViewController = loginViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
}
