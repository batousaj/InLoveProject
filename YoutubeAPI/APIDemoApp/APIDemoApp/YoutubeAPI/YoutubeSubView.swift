//
//  YoutubeSubView.swift
//  APIDemoApp
//
//  Created by Vu Thien on 19/12/2021.
//

import Foundation
import UIKit
import WebKit

class YoutubeSubView : UIViewController {
    
    var poster = UIImageView()
    var nameTitle = UILabel()
    var date = UILabel()
    
    var videoYoutube:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTitle.frame = CGRect(x: 20,
                                   y: 20,
                                   width:self.view.frame.width - 40,
                                   height: 40)
        date.frame = CGRect(x: 20,
                             y: nameTitle.frame.height + 30,
                             width: self.view.frame.width - 40,
                             height: 20)
        videoYoutube = WKWebView.init(frame: CGRect(x:20 ,
                                                    y: 130,
                                                    width: self.view.frame.width - 40,
                                                    height: 300 )) 
        
        view.addSubview(videoYoutube)
        view.addSubview(nameTitle)
        view.addSubview(date)
    }
    
    override func loadView() {
        super.loadView()
    }
    
    func setupView(_ package:YoutubeModel) {
        nameTitle.text = package.title
        date.text = convertDateFormater(package.published)
        let url = URL(string: SessionAPI.VIDEO_WATCH + "npkTUosmU3o")
        let request = URLRequest(url: url!)
        videoYoutube.load(request)
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
