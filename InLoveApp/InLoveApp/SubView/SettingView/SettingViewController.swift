//
//  SettingViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 13/12/2021.
//

import Foundation
import UIKit

class SettingViewController : UIViewController {
    
    var navigator:UINavigationBar!
    var topView:UIView!
    
    var setingTable:UITableView!
    var session:[Session]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configured()
        setupTopView()
        setupNavigatorBar()
        setupTabview()
    }
    
    func setupTopView() {
        topView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        topView.backgroundColor = .systemGray6
        view.addSubview(topView)
    }
    
    func setupNavigatorBar() {
        
        navigator = UINavigationBar.init(frame: CGRect(x: 0, y: topView.frame.height/2, width: view.frame.width, height: 40))
        navigator.barStyle = .default
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDone))
        button.tintColor = .purple
        
        let navigatorItems = UINavigationItem.init(title: "Settings")
        
        navigator.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.systemRed]
        
        navigatorItems.setRightBarButton(button, animated: false)
        navigator.setItems([navigatorItems], animated: false)
        navigator.barTintColor = .systemGray6
        topView.addSubview(navigator)
    }
    
    func setupTabview() {
        setingTable = UITableView.init(frame: CGRect(x: 0, y:200, width: self.view.frame.width, height: self.view.frame.height - 200), style: UITableView.Style.grouped)
        
        setingTable.delegate = self
        setingTable.dataSource = self
        setingTable.reloadData()
        
        setingTable.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        
        view.addSubview(setingTable)
    }
    
    func configured() {
        session = [
            Session.init(title: "", options: [
                SessionOption(title: "Remove Ads", image: nil, optionSwitch: nil, background: .white, handler: nil),
                SessionOption(title: "Restore Purchases", image: nil, optionSwitch: nil, background: .white, handler: nil),
            ]),
        ]
    }
    
    @objc func onClickDone() {
        let subViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubVC") as? SubViewController
        self.view.window?.rootViewController = subViewController
        self.view.window?.makeKeyAndVisible()
    }

}

extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        session.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        cell.configured(session[indexPath.row].options[indexPath.row] as! SessionOption)
        
        return cell
    }
    
}
