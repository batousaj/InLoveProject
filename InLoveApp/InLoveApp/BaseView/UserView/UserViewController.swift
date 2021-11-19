//
//  UserViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 19/11/2021.
//

import Foundation
import UIKit

class UserViewController: UIViewController {

    var testView :UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func horro(_ sender: Any) {
        testView = UIView(frame: CGRect(x:0, y:0, width:320, height:568))
        testView.backgroundColor = UIColor.gray
            testView.alpha = 0.5
            testView.tag = 100
            testView.isUserInteractionEnabled = true
            self.view.addSubview(testView)

            let aSelector : Selector = "removeSubview"
            let tapGesture = UITapGestureRecognizer(target:self, action: aSelector)
            testView.addGestureRecognizer(tapGesture)
        
//        view.addSubview(view1)
    }
    @IBAction func horrrro(_ sender: Any) {
        print("Start remove sibview")
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
}
