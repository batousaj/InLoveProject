//
//  SubViewCell.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation
import UIKit

class SubViewCell : UITableViewCell {
    
    var image:UIImageView!
    var text:UILabel!
    var switchLeft:UISwitch!
    
    func setCellWithValues(_ model:Model) {
        self.intialize()
        self.image.image = UIImage(named: model.image)
        self.text.text = "\(model.name) (\(model.place))"
        
        self.addSubview(text)
        self.addSubview(image)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func intialize() {
        self.image = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.text = UILabel.init(frame: CGRect(x: 60, y: 50, width: self.frame.width - 60, height: self.frame.height))
        self.text.tintColor = .black
        self.text.font = .systemFont(ofSize: 13)
//        text.sizeToFit()
        self.selectionStyle = .none
        switchLeft = UISwitch()
        switchLeft.center = CGPoint(x: 250, y: 0)
    
        self.addSubview(switchLeft)
    }

}
