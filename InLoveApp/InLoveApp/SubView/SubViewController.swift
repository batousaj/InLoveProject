//
//  SubViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation
import UIKit

struct Model {
    var name:String
    var place:String
    var image:String
}

class SubViewController : UIViewController {
    
    //init
    var tableView = UITableView()
    var selectItems:Model!
    let array = [
                  Model(name: "Linh", place: "Ha Noi", image: "gai1.jpg"),
                  Model(name: "Dao", place: "Ho Chi Minh", image: "gai2.jpg"),
                  Model(name: "Ngoc", place: "Da Nang", image: "gai3.jpg"),
                  Model(name: "Huyen", place: "Lam Dong", image: "gai4.jpg"),
                  Model(name: "Trang", place: "Dong Nai", image: "gai5.jpg"),
                  Model(name: "Thao", place: "Tay Ninh", image: "gai6.jpg"),
                  Model(name: "Linh", place: "Ha Noi", image: "gai7.jpg")]
    var viewControllerDetail:SubViewSequeue!
    
    //init subview
    var subButton:UIButton!
    var stackView:UIStackView!
    var isShowStack:Bool!
    
    var settBut:UIButton!
    var popupView:UIView!
    var menu:UIMenu!
    
    let backgroundDuration: TimeInterval = 0.1
    var longPressRecognizer:UILongPressGestureRecognizer!
    
    @IBOutlet var longpressView: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupButtonView()
    }
    
    func setupButtonView() {
        subButton = UIButton.init(frame: CGRect(x: view.frame.width - 80, y: 100, width: 70, height: 20))
        subButton.setTitle("More", for: .normal)
        subButton.setTitleColor(.black, for: .normal)
        subButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        subButton.layer.borderWidth = 1.0
        subButton.layer.borderColor = UIColor.black.cgColor
        subButton.addTarget(self, action: #selector(OnbuttonClick), for: .touchUpInside)
        
        let action1 = UIAction.init(title: "Copy", image: nil, identifier: nil, discoverabilityTitle: nil, attributes: UIMenuElement.Attributes.destructive, state: UIMenuElement.State.off, handler: { action in
            print("Click in Copy")
        })
        
        let action:[UIAction] = [
        
            action1,
            
            UIAction(title: "Pass", image: UIImage(systemName: "swift"), identifier: nil, discoverabilityTitle: nil, attributes: UIMenuElement.Attributes.destructive, state: UIMenuElement.State.off, handler: { action in
                print("Click in Pass")
            }),
            UIAction(title: "Cut", image: UIImage(systemName: "swift"), identifier: nil, discoverabilityTitle: "Cut it now", attributes: UIMenuElement.Attributes.destructive, state: UIMenuElement.State.off, handler: { action in
                print("Click in Cut")
            })
        ]
        
        menu = UIMenu.init(title: "MenuView", image: nil, identifier: nil, options: .displayInline, children: action)
        menu.image?.withTintColor(.blue, renderingMode: .automatic)
        
        subButton.menu = menu
        
        view.addSubview(subButton)
        
        stackView = UIStackView.init(frame: CGRect(x: view.frame.width - 110, y: 125, width: 100, height: 180))
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.backgroundColor = .gray
        
        //init 3 button
        let button1 = UIButton()
        button1.setTitle("Click 1", for: .normal)
        button1.layer.borderWidth = 1.0
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(OnClickBut1), for: .touchUpInside)
        let button2 = UIButton()
        button2.setTitle("Click 2", for: .normal)
        button2.layer.borderWidth = 1.0
        button2.translatesAutoresizingMaskIntoConstraints = false
        let button3 = UIButton()
        button3.setTitle("Click 3", for: .normal)
        button3.layer.borderWidth = 1.0
        button3.translatesAutoresizingMaskIntoConstraints = false
        let button4 = UIButton()
        button4.setTitle("Click 4", for: .normal)
        button4.layer.borderWidth = 1.0
        button4.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        isShowStack = true
        stackView.isHidden = isShowStack
        view.addSubview(stackView)
        
        //setting button
        settBut = UIButton.init(frame: CGRect(x: 20, y: 100, width: 70, height: 30))
        settBut.setTitle("Setting", for: .normal)
        settBut.setTitleColor(.systemBlue, for: .normal)
        settBut.titleLabel?.font = .boldSystemFont(ofSize: 15)
        settBut.layer.borderWidth = 1.0
        settBut.layer.borderColor = UIColor.systemGreen.cgColor
        settBut.addTarget(self, action: #selector(onSettingClick), for: .touchUpInside)
        view.addSubview(settBut)
        
        //longpress button
        longPressRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(onLongPress))
        longPressRecognizer.view?.frame = CGRect(x: 200, y: 100, width: 30, height: 80)
//        longPressRecognizer.minimumPressDuration = 1.5
        subButton.addGestureRecognizer(longPressRecognizer)
        
        popupView = UIView.init(frame: CGRect(x: 100, y: 100, width: 30, height: 80))
    
    }
    
    @IBAction func onPress(_ sender: Any) {
        let press = sender as? UILongPressGestureRecognizer
        if press?.state == .began {
            popupView.becomeFirstResponder()
//            popupView.viewForReset = longPressRecognizer.view
            print("Is first responder")

            var menu = UIMenuController.shared
            var deleteItem = UIMenuItem(title: "Delete", action: Selector("deleteLine"))
            var editItems = UIMenuItem(title: "Edit", action: Selector("editrow"))
            menu.menuItems = [deleteItem ,editItems]

            menu.setTargetRect(CGRect(x: 0, y: 0, width: 100, height: 50), in: popupView)
            menu.isMenuVisible = true
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    func setupTableView() {
        tableView.frame = CGRect(x: 0, y: view.frame.height/3, width: view.frame.width, height: view.frame.height*2/3)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SubViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SubViewSequeue {
            guard let model = sender as? Model else {
                print("Error")
                return
            }
            controller.name = model.name
            controller.place = model.place
            controller.picture = model.image
        }
    }
    
}

extension SubViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubViewCell
        let items = array[indexPath.row]
        cell.setCellWithValues(items)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        selectItems = array[indexPath.row]
//        self.performSegue(withIdentifier: "showDetailFlow", sender: selectItems)
    }
    
    @objc func OnbuttonClick() {
        stackView.isHidden = !stackView.isHidden
    }
    
    @objc func OnClickBut1() {
        stackView.isHidden = true
        let model = array[0]
        self.performSegue(withIdentifier: "showDetailFlow", sender: model)
    }
    
    @objc func onSettingClick() {
        let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as? SettingViewController
        
        self.view.window?.rootViewController = settingViewController
        self.view.window?.makeKeyAndVisible()
    }
        
    @objc func onLongPress( longPressRecognizer:UILongPressGestureRecognizer) {
        //
    }
    
}
