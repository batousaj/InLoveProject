//
//  TableViewCell.swift
//  InLoveApp
//
//  Created by Vu Thien on 05/12/2021.
//

import Foundation
import UIKit

struct Model123 {
    var name:String
    var place:String
    var image:String
}

class TableViewCell : UITableViewCell {
    
    var title:UILabel!
    var date:UILabel!
    var overview:UILabel!
    var rate:UILabel!
    var poster:UIImageView!
    
    let array = [
                    Model123(name: "Linh", place: "Ha Noi", image: "gai1.jpg"),
                    Model123(name: "Dao", place: "Ho Chi Minh", image: "gai2.jpg"),
                    Model123(name: "Ngoc", place: "Da Nang", image: "gai3.jpg"),
                    Model123(name: "Huyen", place: "Lam Dong", image: "gai4.jpg"),
                    Model123(name: "Trang", place: "Dong Nai", image: "gai5.jpg"),
                    Model123(name: "Thao", place: "Tay Ninh", image: "gai6.jpg"),
                    Model123(name: "Linh", place: "Ha Noi", image: "gai7.jpg")]
    
    func setupViewCell(_ data:MoviewModel) {
        viewDidLoad(data)
    }
    
    func viewDidLoad(_ data:MoviewModel) {
        //init poster
        poster = UIImageView.init(frame: CGRect(x: 5, y: 5, width: 60, height: 100))
        poster.image = UIImage(named: array[5].name)
        self.addSubview(poster)
        
        //init title
        title = UILabel.init(frame: CGRect(x: 70, y: 5, width: 70, height: 20))
//        title.text = data.title
        title.textAlignment = .left
        title.font = .boldSystemFont(ofSize: 12)
        title.tintColor = .black
        
        //init date
        date = UILabel.init(frame: CGRect(x: 70, y: 30, width: 70, height: 20))
//        date.text = convertDateFormater(data.releaseDate)
        date.textAlignment = .left
        date.font = .systemFont(ofSize: 13)
        date.tintColor = .gray
        
        //init overview
        overview = UILabel.init(frame: CGRect(x: 70, y: 70, width: 100, height: 40))
//        overview.text = data.overview
        overview.textAlignment = .left
        overview.font = .systemFont(ofSize: 13)
        overview.tintColor = .black
        
    }
    
    // MARK: - Convert date format
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateSuc = DateFormatter()
        dateSuc.dateStyle = .medium
        dateSuc.dateFormat = "DD.MM.YYYY"
        if let originDate = date {
            if let nowDate = dateSuc.date(from: originDate) {
                fixDate = dateSuc.string(from: nowDate)
            }
        }
        return fixDate
    }
}
