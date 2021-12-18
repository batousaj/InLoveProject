//
//  ChatViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 18/12/2021.
//

import Foundation
import UIKit

class ChatViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTable: UITableView!
    @IBOutlet weak var chatViewCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chat"
        navigationItem.backButtonTitle = "<"
        
        self.setupTableView()
    }
    
    func setupTableView() {
        chatTable.delegate = self
        chatTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //
        return cell
    }
    
}
