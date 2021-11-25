//
//  BaseViewController.swift
//  InLoveApp
//
//  Created by Vu Thien on 20/11/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    //inti var
    var buttonImageMe:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOverView()
        setupButtonImage()
        setupButtonInfo()
    }
    
    func setupOverView() {
        view.backgroundColor = UIColor(patternImage:UIImage(imageLiteralResourceName: "BackgroundApp.png"))
    
        let circleView = UIView.init(frame: CGRect(x:view.frame.width/6, y: view.frame.height/5, width: 300, height: 300))
        
        styleCircleImage(circleView)
        
        let but1:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))
        let but2:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))
        let but3:UIButton = UIButton.init(frame: CGRect(x:circleView.frame.width, y: circleView.frame.height, width: 100, height: 50))

        but1.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2 - 60)
        but2.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2)
        but3.center = CGPoint(x: circleView.frame.size.width/2, y: circleView.frame.size.height/2 + 60)
        
        but1.layer.masksToBounds = true
        but1.setTitle("fall in love", for: .normal)
        but1.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        but1.layer.cornerRadius = but1.bounds.width/2.0
        but1.backgroundColor = UIColor.quaternaryLabel
        but1.layer.borderWidth = 3
        but1.layer.borderColor = UIColor.systemOrange.cgColor
        but1.tintColor = UIColor.black
        
        but2.setTitle("0", for: .normal)
        but2.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        but2.tintColor = .black
        
        but3.setTitle("days", for: .normal)
        but3.tintColor = .purple
        
        circleView.addSubview(but1)
        circleView.addSubview(but2)
        circleView.addSubview(but3)
        view.addSubview(circleView)
        
    }
    
    func setupButtonImage() {
        
        //button image me
        buttonImageMe = UIButton.init(frame: CGRect(x:view.frame.width/10, y: view.frame.height*2/3, width: 150, height: 150))
        styleCircleButton(buttonImageMe!)
        buttonImageMe?.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        //button image partner
        let butImagePart = UIButton.init(frame: CGRect(x:view.frame.width*3/5, y: view.frame.height*2/3, width: 150, height: 150))
        styleCircleButton(butImagePart)
        butImagePart.addTarget(self, action: #selector(actionAddImagePart), for: UIButton.Event.touchDown)
        
        view.addSubview(buttonImageMe!)
        view.addSubview(butImagePart)
        
    }
    
    func setupButtonInfo() {
        
        //button me
        let butNameMe = UIButton.init(frame: CGRect(x:view.frame.width/10 + 50, y: view.frame.height*2/3 + 150 + 10, width: 70, height: 30))
        butNameMe.setTitle("Me", for: .normal)
        butNameMe.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        butNameMe.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        let butHoroMe = UIButton.init(frame: CGRect(x:view.frame.width/10 + 40, y: view.frame.height*2/3 + 150 + 10 + 30, width: 70, height: 30))
        butHoroMe.setTitle("Horoscope", for: .normal)
        butHoroMe.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        butHoroMe.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        //button partner
        let butNamePart = UIButton.init(frame: CGRect(x:view.frame.width*3/5 + 50, y: view.frame.height*2/3 + 150 + 10, width: 70, height: 30))
        butNamePart.setTitle("Partner", for: .normal)
        butNamePart.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        butNamePart.addTarget(self, action: #selector(actionAddImagePart), for: UIButton.Event.touchDown)
        
        let butHoroPart = UIButton(type: UIButton.ButtonType.custom)
        butHoroPart.frame = CGRect(x:view.frame.width*3/5 + 40, y: view.frame.height*2/3 + 150 + 10 + 30, width: 70, height: 15)
        butHoroPart.setTitle("123", for: .normal)
        butHoroPart.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        butHoroPart.titleLabel?.numberOfLines = 1
        butHoroPart.titleLabel?.adjustsFontSizeToFitWidth = true
        butHoroPart.titleLabel?.lineBreakMode = .byClipping
        butHoroPart.backgroundColor = .gray
        butHoroPart.layer.cornerRadius = 8
//        butHoroPart.sizeThatFits(CGSize(width: butHoroPart.frame.size.width, height: 15))
        butHoroPart.addTarget(self, action: #selector(actionAddImageMe), for: UIButton.Event.touchDown)
        
        view.addSubview(butNameMe)
        view.addSubview(butNamePart)
        view.addSubview(butHoroMe)
        view.addSubview(butHoroPart)
        
    }
    
    func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.black
        button.sizeToFit()
    }
    
    func styleCircleButton(_ button:UIButton) {
        
        // Circle rounded corner style
        button.layer.masksToBounds = true
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.cornerRadius = button.bounds.width/2.0
        button.backgroundColor = UIColor.quaternaryLabel
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.tintColor = UIColor.gray
        
    }
    
    func styleCircleImage(_ imageView:UIView) {
        
        // Filled rounded corner style
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width/2.0
        imageView.backgroundColor = .white
    }
    
    
    @objc func actionAddImageMe(_ sender:UIButton){
        print("Add picture Me");
    }
    
    @objc func actionAddImagePart(_ sender:UIButton){
        print("Add picture Partner");
        let picker = UIDatePicker(frame: CGRect(x: view.frame.width*3/4, y: view.frame.height*3/4, width: view.frame.width, height: view.frame.height/4))
                                  
                                  view.addSubview(picker)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //do no thing
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [smallRectangleView, bigRectangleView, bigRectangleView2])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var smallRectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var bigRectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var bigRectangleView2: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setupLayout() {
        // Stack View
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        // Small Recntangle View
        let heightConstraint1 = NSLayoutConstraint(item: smallRectangleView, attribute: .height, relatedBy: .equal, toItem: bigRectangleView, attribute: .height, multiplier: 0.25, constant: 0.0)

        // Big Rectangle View
        let heightConstraint2 = NSLayoutConstraint(item: bigRectangleView, attribute: .height, relatedBy: .equal, toItem: bigRectangleView2, attribute: .height, multiplier: 1.0, constant: 0.0)

        NSLayoutConstraint.activate([heightConstraint1, heightConstraint2])
    }
    
}
