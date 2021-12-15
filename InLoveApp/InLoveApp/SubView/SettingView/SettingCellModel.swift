//
//  CellModel.swift
//  InLoveApp
//
//  Created by Vu Thien on 13/12/2021.
//

import Foundation
import UIKit

struct Session {
    let title:String
    let options:[Any]
}

struct SessionOption {
    let title:String
    let image:UIImage?
    let optionSwitch:UISwitch?
    let background:UIColor
    let handler: (() -> Void)?
    
}

