//
//  Alert.swift
//  InLoveApp
//
//  Created by Vu Thien on 20/11/2021.
//

import Foundation
import UIKit

class AlertViewController : UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var imagePicker = UIImagePickerController()
    var date = UIDatePicker()
    var picker = UIPickerView()
    var loadingView = UIActivityIndicatorView()
    
    //int constant
    var textTmp:String!
    var arrayPlay:[String] =  ["NewYork","LonDon","Tokyo","Seoul","HaNoi","Berlin","Rio DeJanero","Paris","BangKok","Singapore"]
    var arrayNum:[String] =  ["1","2","3","4","5","6","7","8","9","10"]
    
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var pickerButton: UIButton!
    
    var datePicker:UIDatePicker = UIDatePicker()
    var alertText:UIAlertController!
    let toolBar = UIToolbar()
    
    var selectedDate:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = self
        setupView()
    }

    
    @IBAction func TextField(_ sender: Any) {
        alertText = UIAlertController(title: "Your Name", message: "Enter a text", preferredStyle: .alert)
        alertText.addTextField { text in
            self.doDatePicker()
            text.inputView = self.datePicker
            text.inputAccessoryView = self.toolBar
            
        }
        
        let save = UIAlertAction(title: "Save", style: .default, handler: { (save:UIAlertAction!) in
            let textField = self.alertText?.textFields![0] // Force unwrapping because we know it exists.
            if textField?.text != ""{
                print("Text field: \(textField?.text!)")
            }
            self.doSaveName()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (cancel) -> Void in
            self.doCancelName()
        })
        
        alertText.addAction(cancel)
        alertText.addAction(save)
        self.present(alertText, animated: true, completion: nil)
    }
    
    func doDatePicker(){

        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: self.view.frame.size.height - 220, width:self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = .date

        // ToolBar

        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true

        self.toolBar.isHidden = false

    }


    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
            dateFormatter1.dateStyle = .medium
            dateFormatter1.timeStyle = .none
//        datePicker.datePickerMode = UIDatePicker.Mode.date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        selectedDate = dateFormatter.string(from: datePicker.date)
        
        datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
    
    func doSaveName() {
        self.view.endEditing(true)
    }
    
    func doCancelName() {
        datePicker.isHidden = true
        self.toolBar.isHidden = true
        self.view.endEditing(true)
    }
    
    @IBAction func PickerBut(_ sender: Any) {
        self.view.addSubview(picker)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerButton.titleLabel?.text = arrayPlay[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.arrayPlay.count
        } else if component == 1 {
            return self.arrayNum.count
        } else {
            return self.arrayNum.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arrayPlay[row]
        } else if component == 1 {
            return arrayNum[row]
        } else {
            return arrayNum[row]
        }
    }
    
    @IBAction func loadingView(_ sender: Any) {
        if loadingView.isAnimating == true{
            loadingView.stopAnimating()
        loadingView = UIActivityIndicatorView(style: .large)
        loadingView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerWork), userInfo: nil, repeats: false)
        }
    }
    
    @objc func timerWork() {
        loadingView.startAnimating()
        view.addSubview(loadingView)
    }
    
    @IBAction func optionsView(_ sender: Any) {
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let sex = UIAlertAction(title: "Sex", style: .default) { (sex) in
            //
        }
        
        let dob = UIAlertAction(title: "Date of Birth", style: .default) { (sex) in
            //
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (cancel) in
            self.view.endEditing(true)
        })
        
        action.addAction(sex)
        action.addAction(dob)
        action.addAction(cancel)
        self.present(action, animated: true, completion: nil)
    }
    
    
    func setupView() {
        dateText.text = "Horroscope"
//        dateText.placeholder = "Horroscope"
        dateText.backgroundColor = UIColor.systemPurple
        dateText.layer.cornerRadius = 8
        
        date.preferredDatePickerStyle = .wheels
        date.datePickerMode = .date
        date.backgroundColor = .lightGray
        dateText.inputView = date
        
        let toolBar = UIToolbar()
        toolBar.tintColor = .blue
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissPicker))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ButtonDone))
        
        toolBar.setItems([cancel,space,done], animated: true)
        toolBar.barStyle = .default
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        dateText.inputAccessoryView = toolBar
        
        self.view.addSubview(dateText)
    }
    
    @objc func ButtonDone() {
        view.endEditing(true)
    }
    
    @objc func dismissPicker() {
       view.endEditing(true)
   }
    
    
    @IBAction func textView(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        let done = UIAlertAction(title: "Done", style: .default) { text in
            self.view.endEditing(true)
        }
        
        let text = UITextView(frame: CGRect(x: 8, y: 8, width: alert.view.frame.width, height: alert.view.frame.height), textContainer: NSTextContainer(size: alert.view.frame.size))
        
        alert.title = " 12345646548asdsa dsa5d4s3a21d3as21d8 sad sa \n asd1sa32d158sa45d1625as165d1csacxcxz846546513 \n 321asd684sa6d1sad96as4d1sa21d6as4d6as46d1sa \n sad4as6d46as0das1d6as69d8"
        
//        alert.view.addSubview(text)
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
    }
    
    
}
