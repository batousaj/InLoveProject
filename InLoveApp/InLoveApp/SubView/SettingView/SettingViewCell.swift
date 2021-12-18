//
//  SettingViewCell.swift
//  InLoveApp
//
//  Created by Vu Thien on 13/12/2021.
//

import Foundation
import UIKit

class SettingCell : UITableViewCell {
    
    private let itemsContainer:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imageContainer:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        return image
    }()
    
    var label:UILabel = {
        let childLabel = UILabel()
        return childLabel
    }()
    
    var switchC = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(itemsContainer)
        itemsContainer.addSubview(imageContainer)
        contentView.addSubview(switchC)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setContainer()
        setLabel()
        setSwitch()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageContainer.image = nil
        itemsContainer.backgroundColor = nil
    }
    
    public func configured(_ session:SessionOption) {
        label.text = session.title
        switchC.isHidden = !session.optionSwitch
        imageContainer.image = session.image
        itemsContainer.backgroundColor = session.background
    }
    
    func setLabel() {
        label.frame = CGRect(x: itemsContainer.frame.width + 25, y: 6, width: 200, height: 30)
        label.font = .systemFont(ofSize: 15)
        label.tintColor = .black
    }
    
    func setContainer() {
        let size = self.frame.height - 12
        itemsContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        imageContainer.sizeToFit()
        imageContainer.center = CGPoint(x: itemsContainer.frame.width/2,y: itemsContainer.frame.height/2)
        imageContainer.tintColor = .white
    }
    
    func setSwitch() {
        switchC.frame = CGRect(x: self.frame.width - 60, y: 6, width: 60, height: self.frame.height - 12)
    }
    
}
