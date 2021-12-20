//
//  YoutubeViewCell.swift
//  APIDemoApp
//
//  Created by Vu Thien on 19/12/2021.
//

import Foundation
import UIKit

class YoutubeViewCell : UITableViewCell {
    
    var title:UILabel = {
        let title = UILabel()
        title.clipsToBounds = true
        return title
    }()
    
    var date:UILabel = {
        let date = UILabel()
        date.clipsToBounds = true
        return date
    }()
    
    var poster = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        poster.frame = CGRect(x: 15, y: 15, width: self.frame.width - 40, height: self.frame.height*2/3 )
        title.frame = CGRect(x: 15, y: self.frame.height*2/3 + 20, width: self.frame.width - 40, height: 30)
        title.font = .boldSystemFont(ofSize: 15)
        date.frame = CGRect(x: 15, y: self.frame.height*2/3 + 55, width: self.frame.width - 40, height: 20)
        date.font = .systemFont(ofSize: 13)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        poster.image = nil
        title.text = nil
        date.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.addSubview(date)
        contentView.addSubview(poster)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuration(_ package:YoutubeModel) {

        let url = URL(string: package.thumbnail)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
                        
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
                        
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.poster.image = image
            }
            
        }.resume()
        
        title.text = package.title
        date.text = convertDateFormater(package.published)
    }
    
    func convertDateFormater(_ date: String) -> String {
        var fixDate = ""
        let dateS = date.components(separatedBy: "T")
        let string = dateS[0]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let newDate = dateFormatter.date(from: string) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            fixDate = dateFormatter.string(from: newDate)
        }
        return fixDate
    }
}
