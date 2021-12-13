//
//  LoginViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 10/12/2021.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController : UIViewController {
    
    //init view
    @IBOutlet weak var AppIconLab: UILabel!
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var SignInBut: UIButton!
    @IBOutlet weak var RegisbUT: UIButton!
    
    var errorAlert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
    }
    
    func setupElement() {
        
        Utilities.styleTextField(UserField)
        Utilities.styleTextField(PassField)
        Utilities.styleHollowButton(SignInBut)
        Utilities.styleLabel(AppIconLab)
        
        //init alert
        errorAlert = UIAlertController(title: "Warning", message: nil, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            self.errorAlert.dismiss(animated: false, completion: nil)
        }
        errorAlert.addAction(OKAction)
        
    }
    
    @IBAction func OnClickSignIn(_ sender: Any) {
        
        let user = UserField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let pass = PassField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: user, password: pass) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                print("Error request password \(error!.localizedDescription)")
                self.showError(error!)
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
//            self.present(homeViewController!, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func OnClickRegister(_ sender: Any) {
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterViewController
        
        self.view.window?.rootViewController = registerViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func showError(_ error:Error) {
        self.errorAlert.message = error.localizedDescription
        self.present(self.errorAlert, animated: true, completion: nil)
    }
}
