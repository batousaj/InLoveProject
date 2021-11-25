//
//  Alert.swift
//  InLoveApp
//
//  Created by Vu Thien on 20/11/2021.
//

import Foundation
import UIKit

class AlertViewController : UIViewController,UIPickerViewDelegate {
    
    var imagePicker = UIImagePickerController()
    var date = UIDatePicker()
    
    var textTmp:String!
    
    @IBOutlet weak var dateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    @IBAction func TextField(_ sender: Any) {
        let alertText = UIAlertController(title: "Your Name", message: "Enter a text", preferredStyle: .alert)
        alertText.addTextField { text in
            self.textTmp = text.text
        }
        
        let save = UIAlertAction(title: "Save", style: .default, handler: { (save:UIAlertAction!) in
            let textField = alertText.textFields![0]
            print("\(textField.text!)")
            self.doSaveName()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (cancel) -> Void in
            self.doCancelName()
        })
        
        alertText.addAction(cancel)
        alertText.addAction(save)
        self.present(alertText, animated: true, completion: nil)
    }
    
    func doSaveName() {
        
    }
    
    func doCancelName() {
        
    }
    
    func setupView() {
        dateText.text = "Horroscope"
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
    
    func buttonImageMe(_ sender: Any) {
//        userView.pickImage(self){ image in
//            //
//        }
       
        //1. Create the alert controller.
           let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)

           //2. Add the text field. You can configure it however you need.
           alert.addTextField { (textField) in
//               self.doDatePicker()
//               textField.inputView = self.datePicker
//               textField.inputAccessoryView = self.toolBar
           }

           // 3. Grab the value from the text field, and print it when the user clicks OK.
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
               let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
               if textField?.text != ""{
                   print("Text field: \(textField?.text!)")
               }
           }))

           // 4. Present the alert.
           self.present(alert, animated: true, completion: nil)
    }
    
    var datePicker:UIDatePicker = UIDatePicker()
    let toolBar = UIToolbar()

   func doDatePicker(){
       // DatePicker
     // datePicker = UIDatePicker()

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
       let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
       toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
       toolBar.isUserInteractionEnabled = true

       self.toolBar.isHidden = false

   }


   @objc func doneClick() {
       let dateFormatter1 = DateFormatter()
       dateFormatter1.dateStyle = .medium
       dateFormatter1.timeStyle = .none

       datePicker.isHidden = true
       self.toolBar.isHidden = true
   }

   @objc func cancelClick() {
       datePicker.isHidden = true
       self.toolBar.isHidden = true
   }
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
//        
//    override init() {
//                super.init()
//                let cameraAction = UIAlertAction(title: "Camera", style: .default){
//                    UIAlertAction in
//                    self.openCamera()
//                }
//                let galleryAction = UIAlertAction(title: "Gallery", style: .default){
//                    UIAlertAction in
//                    self.openGallery()
//                }
//                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
//                    UIAlertAction in
//                }
//
//                // Add the actions
//    //            picker.delegate = self
//                alert.addAction(cameraAction)
//                alert.addAction(galleryAction)
//                alert.addAction(cancelAction)
//            }
//    
//            func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
//                pickImageCallback = callback;
//                self.viewController = viewController;
//
//                alert.popoverPresentationController?.sourceView = self.viewController!.view
//
//                viewController.present(alert, animated: true, completion: nil)
//            }
//            func openCamera(){
//                alert.dismiss(animated: true, completion: nil)
//                if(UIImagePickerController .isSourceTypeAvailable(.camera)){
//                    picker.sourceType = .camera
//                    self.viewController!.present(picker, animated: true, completion: nil)
//                } else {
//                    let alertController: UIAlertController = {
//                        let controller = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
//                        let action = UIAlertAction(title: "OK", style: .default)
//                        controller.addAction(action)
//                        return controller
//                    }()
//                    viewController?.present(alertController, animated: true)
//                }
//            }
//            func openGallery(){
//                alert.dismiss(animated: true, completion: nil)
//                picker.sourceType = .photoLibrary
//                self.viewController!.present(picker, animated: true, completion: nil)
//            }
//
//            
//            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//                picker.dismiss(animated: true, completion: nil)
//            }
//            //for swift below 4.2
//            //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//            //    picker.dismiss(animated: true, completion: nil)
//            //    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//            //    pickImageCallback?(image)
//            //}
//            
//            // For Swift 4.2+
//            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//                picker.dismiss(animated: true, completion: nil)
//                guard let image = info[.originalImage] as? UIImage else {
//                    fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
//                }
//                pickImageCallback?(image)
//            }
//
//
//
//            @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
//            }
}
