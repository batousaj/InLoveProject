//
//  CellModel.swift
//  InLoveApp
//
//  Created by Vu Thien on 13/12/2021.
//

import Foundation
import UIKit

struct Session {
    var header:String
    var footer:String
    let options:[Any]
}

struct SessionOption {
    let title:String
    let image:UIImage?
    let optionSwitch:Bool
    let background:UIColor
    let handler: (() -> Void)
    
}

class SesionOptionsModel {
    
    private var SessionMenu:[Session]!
    var section:Int = 0
    
    var headerTmp:String!
    var footerTmp:String!
    
    func configured() {
        
        SessionMenu = [
            Session.init(header: "", footer:"", options: [
                SessionOption(title: "Airplane Mode", image: UIImage(systemName: "airplane"), optionSwitch: true, background: .systemYellow, handler: {
                    //
                }),
                SessionOption(title: "Wifi", image: UIImage(systemName: "wifi"), optionSwitch: false, background: .systemBlue, handler: {
                    //
                }),
                SessionOption(title: "Bluetooth", image: UIImage(systemName: "network"), optionSwitch: false, background: .systemBlue, handler: {
                    //
                }),
                SessionOption(title: "Cellular", image: UIImage(systemName: "swift"), optionSwitch: false, background: .systemGreen, handler: {
                    //
                }),
            ]),
            
            Session.init(header: "", footer: "", options: [
                SessionOption(title: "Notification", image: UIImage(systemName: "airplane"), optionSwitch: true, background: .systemRed, handler: {
                    //
                }),
                SessionOption(title: "Sound & Haptics", image: UIImage(systemName: "wifi"), optionSwitch: false, background: .systemRed, handler: {
                    //
                }),
                SessionOption(title: "Focus", image: UIImage(systemName: "network"), optionSwitch: false, background: .systemPurple, handler: {
                    //
                }),
                SessionOption(title: "Screen Time", image: UIImage(systemName: "swift"), optionSwitch: false, background: .systemPurple, handler: {
                    //
                }),
            ])
        ]
    }
    
    func getSessionMenu() -> [Session] {
        return self.SessionMenu
    }
    
    func setHeaderFooterSession( headerStr:String, footerStr:String, section:Int) {
        //edit header Here
        SessionMenu[section].header = headerStr
        SessionMenu[section].footer = footerStr
    }
    
}

