//
//  AnimationView.swift
//  InLoveApp
//
//  Created by Vu Thien on 06/12/2021.
//

import Foundation
import UIKit

class Animation : UIViewController {
    
    var slider:UISlider!
    var progress:UIProgressView!
    
    var progressBut:UIButton!
    var value:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        progressBut = UIButton.init(frame: CGRect(x: self.view.frame.width*3/4, y: self.view.frame.height/2, width: 200, height: 70))
        progressBut.center = view.center
        progressBut.setTitle("Progress", for: .normal)
        progressBut.setTitleColor(.black, for: .normal)
        progressBut.addTarget(self, action: #selector(buttonProgress), for: .touchUpInside)
        progress = UIProgressView.init(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        
        slider = UISlider.init(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        slider.addTarget(self, action: #selector(buttonSlier), for: .touchUpInside)
        
        self.view.addSubview(progressBut)
        self.view.addSubview(slider)
        self.view.addSubview(progress)
    }
    
}

extension Animation {
    @objc func buttonProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { time in
            if self.progress.progress == 1 {
                self.progress.progress = 0
                time.invalidate()
                return
            }
            self.progress.progress += 0.1
        }
    }
    
    @objc func buttonSlier() {
        if value == self.slider.value {
            return
        }
        value = self.slider.value
        print("This is a value : \(value)")
    }
}
