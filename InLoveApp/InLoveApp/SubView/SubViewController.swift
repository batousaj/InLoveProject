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

class SubViewController : UIViewController,UITableViewDelegate {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let notification = UserNotification.init()
    }
    
    func setupTableView() {
        tableView.frame = CGRect(x: 0, y: view.frame.height/3, width: view.frame.width, height: view.frame.height*2/3)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SubViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectItems = array[indexPath.row]
        self.performSegue(withIdentifier: "showDetailFlow", sender: selectItems)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SubViewSequeue {
            controller.name = selectItems.name
            controller.place = selectItems.place
            controller.picture = selectItems.image
        }
    }
    
}

extension SubViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubViewCell
        let items = array[indexPath.row]
        cell.setCellWithValues(items)
        return cell
    }
    
}
