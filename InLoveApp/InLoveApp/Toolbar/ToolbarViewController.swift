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
        bottomToolBar = UIToolbar.init(frame: CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 50))
        var items = [UIBarButtonItem]()
        
        let buton1 = UIButton.init(frame: CGRect(x: 550, y: view.frame.height - 40, width: 40, height: 20))
        buton1.setTitle("Sheet 4", for: .normal)
        buton1.setTitleColor(.black, for: .normal)
        
        let button2 = UIBarButtonItem(customView: buton1)
//        button2.SystemItem = .flexibleSpace
        
        items.append(
            UIBarButtonItem(title: "Sheet 1", style: .plain, target: self, action: #selector(OnClickSheet1))
        )
        items.append(
            UIBarButtonItem(title: "Sheet 2", style: .plain, target: self, action: #selector(OnClickSheet2))
        )
        items.append(
            UIBarButtonItem(title: "Sheet 3", style: .plain, target: self, action: #selector(OnClickSheet3))
        )
        items.append(
            button2
        )
        
        bottomToolBar.barStyle = .default
        bottomToolBar.setItems(items, animated: true)
        
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
