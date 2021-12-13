//
//  ToolbarViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 10/12/2021.
//

import Foundation
import UIKit

class ToolBarViewController : UIViewController {
    
    //init Toolbar
    var bottomToolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomToolBar()
        bottomToolBar.delegate = self
    }
    
    func setupBottomToolBar() {
        bottomToolBar = UIToolbar.init(frame: CGRect(x: 0, y: view.frame.height - 80, width: view.frame.width, height: 80))
        var items = [UIBarButtonItem]()
        
        let buton1 = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
//        buton1.setTitle("Sheet 4", for: .normal)
        buton1.setTitleColor(.black, for: .normal)
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = "title"
        configuration.image = UIImage(systemName: "swift")
        configuration.imagePlacement = .top
        configuration.titlePadding = 5
        configuration.imagePadding = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        buton1.configuration = configuration
        
        let button2 = UIBarButtonItem(customView: buton1)
        
        let buton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        buton.setTitle("Sheet 1", for: .normal)
        buton.setTitleColor(.black, for: .normal)
        buton.layer.borderWidth = 1.0
        buton.contentVerticalAlignment = .top
        
        var configuration1 = UIButton.Configuration.plain()
        configuration1.title = "Book"
        configuration1.image = UIImage(systemName: "book")
        configuration1.imagePlacement = .leading
        configuration1.titlePadding = 5
        configuration1.imagePadding = 5
        configuration1.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        buton.configuration = configuration1
        
        let button3 = UIBarButtonItem(customView: buton)
        button3.setTitlePositionAdjustment(UIOffset(horizontal: -10, vertical: -10), for: .default)
        
        items.append(
            button2
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            button3
        )
        
        bottomToolBar.barStyle = .default
        bottomToolBar.setItems(items, animated: true)
        
        bottomToolBar.alignmentRect(forFrame: CGRect(x: 5, y: 5, width: 20, height: 40))
        
        view.addSubview(bottomToolBar)
    }
}

extension ToolBarViewController : UIToolbarDelegate {
    
    @objc func OnClickSheet1() {
        print("That's sheet 1")
    }
    
    @objc func OnClickSheet2() {
        print("That's sheet 2")
    }
    
    @objc func OnClickSheet3() {
        print("That's sheet 3")
    }
    
}
