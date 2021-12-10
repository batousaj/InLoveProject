//
//  APISegue.swift
//  InLoveApp
//
//  Created by Vu Thien on 07/12/2021.
//

import Foundation
import UIKit

class APISegueViewController : UIViewController {

    var image:UIImageView!
    var label:UILabel!
    
    var name:String?
    var place:String?
    var picture:String?
    
    var backButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton = UIButton.init(frame: CGRect(x: 10, y: 20, width: 60, height: 30))
        backButton.layer.masksToBounds = true
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backToFather), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    func setMoviewData(_ data:MoviewModel) {
        image = UIImageView.init(frame: CGRect(x: 100, y: view.frame.height/3, width: view.frame.width/2, height: view.frame.height/3))
        image.image = UIImage(named: "gai5.jpg")
        image.center = view.center
        view.addSubview(image)
        
        label = UILabel.init(frame: CGRect(x: 100, y: view.frame.height/2 + 20, width: view.frame.width/2, height: view.frame.height/3))
//        label.center = view.center
        label.text = "\(data.title!) (\(data.overview!))"
        view.addSubview(label)
    }
    
    @objc func backToFather(){
        self.dismiss(animated: true, completion: nil)
    }

}
