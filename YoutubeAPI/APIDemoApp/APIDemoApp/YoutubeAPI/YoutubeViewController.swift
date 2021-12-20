//
//  YoutubeViewController.swift
//  APIDemoApp
//
//  Created by Vu Thien on 19/12/2021.
//

import Foundation
import UIKit

struct APIpackage {
    var title:String
    var image:UIImage
    var date:String
}

class YoutubeViewController : UIViewController {

    var tableView:UITableView!
    var package:APIpackage!
    
    var youtubeData:[YoutubeModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Youtube Video"
        
        setupTableView()
    }
    
    func setupTableView() {
        YoutubeAPI.getData(url:SessionAPI.API_URL) { results in
            switch results {
                case .success(let response) :
                    self.tableView.dataSource = self
                    self.tableView.delegate = self
                    self.youtubeData = response.items
                    break
                case .failure(let error) :
                    print("\(error)")
                    break
            }
        }
        
        tableView = UITableView(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height: self.view.frame.height - 110), style: .plain)
        tableView.backgroundColor = .systemGray6
        tableView.register(YoutubeViewCell.self, forCellReuseIdentifier: "YoutubeCell")
        tableView.sectionHeaderHeight = 1.0
        tableView.tableHeaderView?.isHidden = true
        tableView.sectionFooterHeight = 1.0
        view.addSubview(tableView)
    }
}

extension YoutubeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youtubeData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeCell") as! YoutubeViewCell
        cell.configuration(youtubeData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "YoutubeSubVC") as! YoutubeSubView
//        vc.modalTransitionStyle = .flipHorizontal
//        self.navigationController!.pushViewController(vc, animated: true)
        self.present(vc, animated: true) {
            vc.setupView(self.youtubeData[indexPath.row])
        }
    }
}
