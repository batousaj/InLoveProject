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
    
    var label:UILabel = {
        let childLabel = UILabel()
        return childLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.addSubview(itemsContainer)
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemsContainer.frame = CGRect(x: 10, y: 6, width: self.frame.width, height: self.frame.height)
        label.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configured(_ session:SessionOption) {
        label.text = session.title
        label.font = .systemFont(ofSize: 13)
    }
    
}
