//
//  SetingSearchViewCell.swift
//  InLoveApp
//
//  Created by Vu Thien on 16/12/2021.
//

import Foundation
import UIKit

class UISearchViewCell : UITableViewCell {
    
    var label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label = UILabel.init(frame: CGRect(x: 50, y: 5, width: 200, height: 30))
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(label)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        label.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configured(_ string:String) {
        label.text = string
    }
    
}
