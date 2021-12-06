//
//  MediaShareAndShow.swift
//  InLoveApp
//
//  Created by Vu Thien on 27/11/2021.
//

import Foundation
import UIKit
import Photos
import PhotosUI

class MediaAndImageViewController : UIViewController,PHPickerViewControllerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIActivityItemSource {
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Nothing"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType == .airDrop {
            print("Post to airDrop")
        }
        return "Done"
    }
    
    
    //photos
    var allPhotos : PHFetchResult<PHAsset>? = nil
    
    //pickerViewImage
    var picker:PHPickerViewController?
    var pickerCamera = UIImagePickerController()
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    
    //Button
    @IBOutlet weak var buttImage: UIButton!
    @IBOutlet weak var shareImage: UIButton!
    @IBOutlet weak var shareText: UIButton!
    
    //ImageShow
    var imageView = UIImageView()
    var imageShow = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = checkImageFlech()
        if a == true {
            print("Init Successed")
        }

        setupAction()
        registerNotification()
    }
    
    func setupAction() {
        buttImage.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        shareImage.addTarget(self, action: #selector(shareImageButton), for: .touchUpInside)
        shareText.addTarget(self, action: #selector(shareTextButton), for: .touchUpInside)
        
        imageView = UIImageView.init(frame: CGRect(x: 20 , y: view.frame.size.height*2/3, width: 400, height: 100))
        view.addSubview(imageView)
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage), name: NSNotification.Name("IsUpdateImage"), object: nil)
        
    }
    
    func checkImageFlech() -> Bool {
        
        var author = true
        /// Load Photos
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                print("Good to proceed")
                author = true
                let fetchOptions = PHFetchOptions()
                self.allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            case .denied, .restricted:
                print("Not allowed")
                author = false
            case .notDetermined:
                print("Not determined yet")
                author = false
            case .limited:
                author = false
                break
            @unknown default:
                break
            }
        }
        return author
    }
    
    // share text
    @objc func shareTextButton() {

            // text to share
            let text = "This is some text that I want to share."

            // set up activity view controller
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)

        }

    // share image
    @objc func shareImageButton() {

            // image to share
            let image = UIImage(named: "Image")

            // set up activity view controller
            let imageToShare = [ image! ]
            let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop,
                                                             UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.postToFacebook ]

            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func chooseImage() {
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){ UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){  UIAlertAction in
        }
        
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        
        if #available(iOS 14.0,*) {
            var pickerConfiguration = PHPickerConfiguration()
            pickerConfiguration.filter = .images
            pickerConfiguration.selectionLimit = 5
            
            picker = PHPickerViewController(configuration: pickerConfiguration)
            
            picker!.delegate = self
            self.present(picker!, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "This is required IOS version Higher", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        for items in results {
            items.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {
                ( object,error ) in
                if error != nil {
                    print("Error with code : \(String(describing: error))")
                }
                self.imageShow = object as! UIImage
                NotificationCenter.default.post(name: NSNotification.Name("IsUpdateImage"), object: nil)
            })
        }
        
    }

    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        pickerCamera.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerCamera.sourceType = .camera
            self.present(pickerCamera, animated: true, completion: nil)
            
        } else {
            let alertWarn = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                alertWarn.dismiss(animated: true, completion: nil)
            }
            alertWarn.addAction(actionOK)
            self.present(alertWarn, animated: true, completion: nil)
        }
        
    }
    
    @objc func updateImage() {
        DispatchQueue.main.async {
            self.imageView.image = self.imageShow
        }
        
    }
    
     
/// Display Photo
//    let asset = allPhotos?.object(at: indexPath.row)
//    self.imageview.fetchImage(asset: asset!, contentMode: .aspectFit, targetSize: self.imageview.frame.size)
//
//
//    // Or Display image in Collection View cell
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! SelectPhotoCell
//
//        let asset = allPhotos?.object(at: indexPath.row)
//        cell.imgPicture.fetchImage(asset: asset!, contentMode: .aspectFit, targetSize: cell.imgPicture.frame.size)
//
//        return cell
//    }

    
    
    
    
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

extension UIImageView{
 func fetchImage(asset: PHAsset, contentMode: PHImageContentMode, targetSize: CGSize) {
    let options = PHImageRequestOptions()
    options.version = .original
    PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { image, _ in
        guard let image = image else { return }
        switch contentMode {
        case .aspectFill:
            self.contentMode = .scaleAspectFill
        case .aspectFit:
            self.contentMode = .scaleAspectFit
        }
        self.image = image
    }
   }
}
