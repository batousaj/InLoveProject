//
//  SettingSearchView.swift
//  InLoveApp
//
//  Created by Vu Thien on 16/12/2021.
//

import Foundation
import UIKit

class UISearchView : UIView,  UITableViewDelegate, UITableViewDataSource {
    
    var searchTable:UITableView!
    var searchText:String!
    
    var dataStr = [String]()
    var sourceStr = [String]()
    var model = SesionOptionsModel()
    
    private var sessionMenu:[Session]!
    var numberRow:Int = 0
    
    override func layoutSubviews() {
         super.layoutSubviews()
    }
    
    func initWithFrame(_ frame:CGRect) {
        self.frame = frame
        searchTable = UITableView.init(frame: CGRect(x: 0, y:0, width: self.frame.width, height: self.frame.height), style: UITableView.Style.plain)
        searchTable.backgroundColor = .systemGray5
        searchTable.delegate = self
        searchTable.dataSource = self
        searchTable.sectionHeaderHeight = 1.0
        searchTable.sectionFooterHeight = 1.0
        searchTable.register(UISearchViewCell.self, forCellReuseIdentifier: "SearchCell")
        self.searchTable.reloadData()
        self.addSubview(searchTable)
        addDataSource()
    }
    
    func addString(_ string:String) {
        searchText = string
        numberRow = 0
        sourceStr.removeAll()
        for data in dataStr {
            if data.contains(string) {
                numberRow+=1
                print("tHIE:\(data),\(numberRow)")
                sourceStr.append(
                    data
                )
            }
        }
        self.searchTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! UISearchViewCell
        print("tHIE:\(sourceStr[indexPath.row])")
        cell.configured(sourceStr[indexPath.row])
        return cell
    }
    
    public func addDataSource() {
        model.configured()
        sessionMenu = model.getSessionMenu()
        
        for i in (0..<sessionMenu.count) {
            for y in (0..<sessionMenu[i].options.count) {
                dataStr.append(
                    (sessionMenu[i].options[y] as! SessionOption).title
                )
            }
        }
        
    }
    
}
