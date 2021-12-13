//
//  RegisterViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 12/12/2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController : UIViewController {
    
    @IBOutlet weak var SignInBut: UIButton!
    @IBOutlet weak var fistNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    var errorAlert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElement()
    }
    
    func setupElement() {
        Utilities.styleTextField(fistNameField)
        Utilities.styleTextField(lastNameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passField)
        
        Utilities.styleHollowButton(SignInBut)
        
        //init placeholder
        fistNameField.placeholder = "FristName"
        lastNameField.placeholder = "LastName"
        emailField.placeholder = "Email"
        passField.placeholder = "Password"
        
        //init alert
        errorAlert = UIAlertController(title: "Warning", message: nil, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            self.errorAlert.dismiss(animated: false, completion: nil)
        }
        errorAlert.addAction(OKAction)
    }
    
    @IBAction func onClickSignIn(_ sender: Any) {
        
        let fisrtName = fistNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = passField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                print("Error request password \(error!.localizedDescription)")
                self.showError(error!)
            }
            else {
                
                let db = Firestore.firestore()
                
                db.collection("users1").addDocument(data: ["ID":fisrtName, "Name":lastName, "uid": result!.user.uid]) { error in
                    
                    if error != nil {
                        self.showError(error!)
                        return
                    }
                    
                    self.transitLoginView()
                }
            }
            
        }
        
    }
    
    func transitLoginView() {
        let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        
        self.view.window?.rootViewController = LoginViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func showError(_ error:Error) {
        self.errorAlert.message = error.localizedDescription
        self.present(self.errorAlert, animated: true, completion: nil)
    }
    
    func showErrorString(_ string:String) {
        self.errorAlert.message = string
        self.present(self.errorAlert, animated: true, completion: nil)
    }
}

extension RegisterViewController {
    
    func validatePassword() {
        
        // Check that all fields are filled in
        if fistNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            showErrorString("Please fill in all the information")
            return
        }
        
        let pass = passField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(pass) == true {
            showErrorString("Please make sure your password is at least 8 characters, contains a special character and a number.")
            return
        }
    }
}
