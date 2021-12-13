//
//  Utilities.swift
//  InLoveApp
//
//  Created by Vu Thien on 11/12/2021.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width - 25, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleLabel(_ label:UILabel) {
        
        // Hollow rounded corner style
//        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .red
        
        let attachment = NSTextAttachment(image: (UIImage(systemName: "swift"))!)
        let attachment1 = NSAttributedString(string: "LoginView")
        let atributeStr = NSAttributedString(attachment: attachment)
        
        let mulStr = NSMutableAttributedString(attributedString: atributeStr)
        mulStr.append(attachment1)
        
        label.attributedText = mulStr
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
