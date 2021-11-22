//
//  BaseViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 20/11/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    //inti var
    var buttonImageMe:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOverView()
        setupButtonImage()
        setupButtonInfo()
    }
    
    func setupOverView() {
        view.backgroundColor = UIColor(patternImage:UIImage(imageLiteralResourceName: "BackgroundApp.png"))
    
        let circleView = UIView.init(frame: CGRect(x:view.frame.width/6, y: view.frame.height/5, width: 300, height: 300))
        
        styleCircleImage(circleView)
        
        let but1:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))
        let but2:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))
        let but3:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))

        
        but1.setTitle("fall in love", for: .normal)
        but1.backgroundColor = .gray
        but2.setTitle("0", for: .normal)
        but2.backgroundColor = .gray
        but2.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        but3.setTitle("days", for: .normal)
        but3.backgroundColor = .gray
        
        but1.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2 - 60)
        circleView.addSubview(but1)
        but2.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2)
        circleView.addSubview(but2)
        but3.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2 + 60)
        circleView.addSubview(but3)
        
        view.addSubview(circleView)
        
    }
    
    func setupButtonImage() {
        
        //button image me
        buttonImageMe = UIButton.init(frame: CGRect(x:view.frame.width/10, y: view.frame.height*2/3, width: 150, height: 150))
        styleCircleButton(buttonImageMe!)
        buttonImageMe?.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        //button image partner
        let butImagePart = UIButton.init(frame: CGRect(x:view.frame.width*3/5, y: view.frame.height*2/3, width: 150, height: 150))
        styleCircleButton(butImagePart)
        butImagePart.addTarget(self, action: #selector(actionAddImagePart), for: UIButton.Event.touchDown)
        
        view.addSubview(buttonImageMe!)
        view.addSubview(butImagePart)
        
    }
    
    func setupButtonInfo() {
        
        //button me
        let butNameMe = UIButton.init(frame: CGRect(x:view.frame.width/10 + 50, y: view.frame.height*2/3 + 150 + 10, width: 70, height: 30))
        butNameMe.setTitle("Me", for: .normal)
        butNameMe.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        butNameMe.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        //button partner
        let butNamePart = UIButton.init(frame: CGRect(x:view.frame.width*3/5 + 50, y: view.frame.height*2/3 + 150 + 10, width: 70, height: 30))
        butNamePart.setTitle("Partner", for: .normal)
        butNamePart.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        butNamePart.addTarget(self, action: #selector(actionAddImagePart), for: UIButton.Event.touchDown)
        
        view.addSubview(butNameMe)
        view.addSubview(butNamePart)
        
    }
    
    func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.black
        button.sizeToFit()
    }
    
    func styleCircleButton(_ button:UIButton) {
        
        // Circle rounded corner style
        button.layer.masksToBounds = true
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.cornerRadius = button.bounds.width/2.0
        button.backgroundColor = UIColor.quaternaryLabel
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.tintColor = UIColor.gray
        
    }
    
    func styleCircleImage(_ imageView:UIView) {
        
        // Filled rounded corner style
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width/2.0
        imageView.backgroundColor = .white
    }
    
    
    @objc func actionAddImageMe(_ sender:UIButton){
        print("Add picture Me");
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)

        alert.addTextField { (textField) in

        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self, weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            if textField?.text != ""{
                print("Text field: \(textField?.text!)")
            }
            
            self.buttonImageMe?.setTitle(textField?.text, for: .normal)
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func actionAddImagePart(_ sender:UIButton){
        print("Add picture Partner");
    }
    
}
