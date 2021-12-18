//
//  SettingViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 13/12/2021.
//

import Foundation
import UIKit
import SwiftUI

class SettingViewController : UIViewController {
    
    var navigator:UINavigationBar!
    var topView:UIView!
    var searchNavigator:UINavigationBar!
    var searchField:UITextField!
    
    let sessionModel = SesionOptionsModel()
    var setingTable:UITableView!
    var searchView = UISearchView()
    var SessionMenu:[Session]!
    
// MARK: - Setup loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupTopView()
        setupNavigatorBar()
        setupSearchBar()
        setupTabview()
        
    }
    
    func setupTopView() {
        topView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        topView.backgroundColor = .systemGray6
        view.addSubview(topView)
        
    }
    
    func setupSearchBar() {
//        using Textfield
        searchField = UITextField.init(frame: CGRect(x: 15, y: 140, width: view.frame.width - 30, height: 40))
        searchField.leftViewMode = .always
        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = .gray
        searchField.leftView = imageView
        searchField.placeholder = "Search"
        searchField.tintColor = .systemGray3
        searchField.backgroundColor = .systemGray6
        searchField.layer.cornerRadius = 10
        searchField.delegate = self
        view.addSubview(searchField)
    }
    
    func configuration() {
        sessionModel.configured()
        sessionModel.setHeaderFooterSession(headerStr: "General", footerStr: "", section: 0)
        sessionModel.setHeaderFooterSession(headerStr: "", footerStr: "Notes: If you forget the password, you have to reinstall the app from App store", section: 1)
        SessionMenu = sessionModel.getSessionMenu()
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
        
        searchView.initWithFrame(CGRect(x: 0, y:200, width: self.view.frame.width, height: self.view.frame.height - 200))
        
        setingTable.delegate = self
        setingTable.dataSource = self
        setingTable.reloadData()
        
        setingTable.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        
        view.addSubview(setingTable)
    }
    
// MARK: - Action
    @objc func onClickDone() {
        let subViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubVC") as? SubViewController
        self.view.window?.rootViewController = subViewController
        self.view.window?.makeKeyAndVisible()
    }

}

extension SettingViewController : UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
// MARK: - TableView setup
    func numberOfSections(in tableView: UITableView) -> Int {
        return SessionMenu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SessionMenu[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        cell.configured(SessionMenu[indexPath.section].options[indexPath.row] as! SessionOption)
        
        return cell
    }
    
// MARK: - section view
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SessionMenu[section].header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if SessionMenu[section].header != "" {
            return 50.0
        }
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return SessionMenu[section].footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let title = (SessionMenu[indexPath.section].options[indexPath.row] as? SessionOption)?.title else {
            print("Error convert")
            return
        }
        print("This is \(title)")
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let myLabel = UILabel()
//        myLabel.frame = CGRect(x: 20, y: 8, width: tableView.frame.width, height: tableView.frame.height)
//        myLabel.font = UIFont.systemFont(ofSize: 8)
//        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
//
//        let headerView = UIView()
//        headerView.addSubview(myLabel)
//
//        return headerView
//    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        setingTable.removeFromSuperview()
//        view.addSubview(searchView.searchTable)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("This is \(textField.text)")
        searchView.addString(textField.text!)
        if textField.text == "" {
            searchView.searchTable.removeFromSuperview()
            view.addSubview(setingTable)
        } else {
            setingTable.removeFromSuperview()
            view.addSubview(searchView)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
}
