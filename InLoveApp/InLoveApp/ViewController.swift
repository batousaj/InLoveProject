//
//  ViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 19/11/2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet weak var partnerImage: UIImageView!
    
    @IBOutlet weak var textMe: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupElement()
    }
    
    func setupElement() {
        getMeImage()
//        Utilities.styleFilledImage(meImage)
//        Utilities.styleFilledImage(partnerImage)
    }
    
    func getMeImage() {
        
        let image = UIImage.init(imageLiteralResourceName: "ImageMe.png")
        
        partnerImage.image = image
        Utilities.styleFilledImage(partnerImage)
        
        
    }
}
