//
//  MediaShareAndShow.swift
//  InLoveApp
//
//  Created by Vu Thien on 27/11/2021.
//

import Foundation
import UIKit

class MediaAndImageViewController : UIViewController {
    
     var picker = UIImagePickerController();
     var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
     var viewController: UIViewController?
     var pickImageCallback : ((UIImage) -> ())?;
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }

        // Add the actions
//            picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
 
             func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
                 pickImageCallback = callback;
//                 self.viewController = viewController;
 
                 alert.popoverPresentationController?.sourceView = self.viewController!.view
 
                 self.present(alert, animated: true, completion: nil)
             }
             func openCamera(){
                 alert.dismiss(animated: true, completion: nil)
                 if(UIImagePickerController .isSourceTypeAvailable(.camera)){
                     picker.sourceType = .camera
                     self.present(picker, animated: true, completion: nil)
                 } else {
                     let alertController: UIAlertController = {
                         let controller = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                         let action = UIAlertAction(title: "OK", style: .default)
                         controller.addAction(action)
                         return controller
                     }()
                     self.present(alertController, animated: true)
                 }
             }
             func openGallery(){
                 alert.dismiss(animated: true, completion: nil)
                 picker.sourceType = .photoLibrary
                 self.present(picker, animated: true, completion: nil)
             }
 
 
             func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                 picker.dismiss(animated: true, completion: nil)
             }
             //for swift below 4.2
             //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
             //    picker.dismiss(animated: true, completion: nil)
             //    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
             //    pickImageCallback?(image)
             //}
 
             // For Swift 4.2+
             func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                 picker.dismiss(animated: true, completion: nil)
                 guard let image = info[.originalImage] as? UIImage else {
                     fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                 }
                 pickImageCallback?(image)
             }
 
 
 
             @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
             }
    
//    // share text
//        @IBAction func shareTextButton(_ sender: UIButton) {
//
//            // text to share
//            let text = "This is some text that I want to share."
//
//            // set up activity view controller
//            let textToShare = [ text ]
//            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
//            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//
//            // exclude some activity types from the list (optional)
//            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
//
//            // present the view controller
//            self.present(activityViewController, animated: true, completion: nil)
//
//        }
//
//        // share image
//        @IBAction func shareImageButton(_ sender: UIButton) {
//
//            // image to share
//            let image = UIImage(named: "Image")
//
//            // set up activity view controller
//            let imageToShare = [ image! ]
//            let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
//            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//
//            // exclude some activity types from the list (optional)
//            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
//
//            // present the view controller
//            self.present(activityViewController, animated: true, completion: nil)
//      }
     
//
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var filterButton: UIButton!
//    @IBOutlet weak var saveButton: UIButton!
//    let destinationUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        .appendingPathComponent("filteredImage.png")
//    let imagePicker = UIImagePickerController()
//    let messageFrame = UIView()
//    var activityIndicator = UIActivityIndicatorView()
//    var strLabel = UILabel()
//    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
//    func activityIndicator(_ title: String) {
//        strLabel.removeFromSuperview()
//        activityIndicator.removeFromSuperview()
//        effectView.removeFromSuperview()
//        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
//        strLabel.text = title
//        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
//        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
//        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
//        effectView.layer.cornerRadius = 15
//        effectView.layer.masksToBounds = true
//        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
//        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
//        activityIndicator.startAnimating()
//        effectView.contentView.addSubview(activityIndicator)
//        effectView.contentView.addSubview(strLabel)
//        view.addSubview(effectView)
//    }
//    func saveImage() {
//        do {
//            try imageView.image?.data?.write(to: destinationUrl, options: .atomic)
//            print("file saved")
//        } catch {
//            print(error)
//        }
//    }
//    func applyFilterToImage() {
//        imageView.image = imageView.image?.applying(contrast: 1.5)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        guard let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/a8/VST_images_the_Lagoon_Nebula.jpg"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
//        view.backgroundColor = UIColor(white: 0, alpha: 1)
//        imageView.image = image
//    }
//    @IBAction func startSavingImage(_ sender: AnyObject) {
//        saveButton.isEnabled = false
//        filterButton.isEnabled = false
//        activityIndicator("Saving Image")
//        DispatchQueue.main.async {
//            self.saveImage()
//            DispatchQueue.main.async {
//                self.effectView.removeFromSuperview()
//                self.saveButton.isEnabled = true
//                self.filterButton.isEnabled = true
//            }
//        }
//    }
//    @IBAction func filterAction(_ sender: AnyObject) {
//        filterButton.isEnabled = false
//        saveButton.isEnabled = false
//        activityIndicator("Applying Filter")
//        DispatchQueue.main.async {
//            self.applyFilterToImage()
//            DispatchQueue.main.async {
//                self.effectView.removeFromSuperview()
//                self.filterButton.isEnabled = true
//                self.saveButton.isEnabled = true
//            }
//        }
//    }
//    @IBAction func cameraAction(_ sender: AnyObject) {
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera
//            present(imagePicker, animated: true)
//        }
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
//        dismiss(animated: true, completion: nil)
//        imageView.image = image
//    }
}
