//
//  Text.swift
//  InLoveApp
//
//  Created by Vu Thien on 02/12/2021.
//

import Foundation
import UIKit

class TextViewController : UIViewController,UITextViewDelegate {
    
    var textView:UITextView!
    var alertView:UIAlertController!
    var attributedText:NSMutableAttributedString!

    let string1 = "Bằng việc đăng ký, bạn đồng ý với Điều khoản sử dụng và Chính sách bảo mật của chúng tôi."
    
    let string2 = "xxxxxxxccccccccvvvvvvvvvvvnnvlsakfjloisafoidhojfhakjhfiuehwflkndslvasdajsbckbdsibaibdjbfnkasdjkn akvjnkajndsjvnionoinonoaisdfondfjad  dpajo fjdo adojsf doia oifjoj aoij oaijo joidjaofijdog od aois jogij aoi odaj oidjsg oijao jgoaij goija oijg oiajoijgo aodi oajo gdoaij gioaj gidjg oiajo gijodajg dsang o gidsj gaobigeowugo ijsojaidf a dosfijoi jjoudh  disjfodi daj fdi foiaj o jhfihi foho hfh dshf iohfo iaodsfo da dofh odahfo dhofh adhf duhajdhfu adhf jdufh dahfidh ojd fiodaofdo daif oahdfo daofh doaif oihoaf di  adifdijfoiadhf htidf oihds fjd fodifajd aefio daofjo aior odh da eao xxxxxxxccccccccvvvvvvvvvvvnnvlsakfjloisafoidhojfhakjhfiuehwflkndslvasdajsbckbdsibaibdjbfnkasdjkn akvjnkajndsjvnionoinonoaisdfondfjad  dpajo fjdo adojsf doia oifjoj aoij oaijo joidjaofijdog od aois jogij aoi odaj oidjsg oijao jgoaij goija oijg oiajoijgo aodi oajo gdoaij gioaj gidjg oiajo gijodajg dsang o gidsj gaobigeowugo ijsojaidf a dosfijoi jjoudh  disjfodi daj fdi foiaj o jhfihi foho hfh dshf iohfo iaodsfo da dofh odahfo dhofh adhf duhajdhfu adhf jdufh dahfidh ojd fiodaofdo daif oahdfo daofh doaif oihoaf di  adifdijfoiadhf htidf oihds fjd fodifajd aefio daofjo aior odh da eaoxxxxxxxccccccccvvvvvvvvvvvnnvlsakfjloisafoidhojfhakjhfiuehwflkndslvasdajsbckbdsibaibdjbfnkasdjkn akvjnkajndsjvnionoinonoaisdfondfjad  dpajo fjdo adojsf doia oifjoj aoij oaijo joidjaofijdog od aois jogij aoi odaj oidjsg oijao jgoaij goija oijg oiajoijgo aodi oajo gdoaij gioaj gidjg oiajo gijodajg dsang o gidsj gaobigeowugo ijsojaidf a dosfijoi jjoudh  disjfodi daj fdi foiaj o jhfihi foho hfh dshf iohfo iaodsfo da dofh odahfo dhofh adhf duhajdhfu adhf jdufh dahfidh ojd fiodaofdo daif oahdfo daofh doaif oihoaf di  adifdijfoiadhf htidf oihds fjd fodifajd aefio daofjo aior odh da eao "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
    }
    
    func setupButton() {
        alertView = UIAlertController(title: "Policy", message:nil, preferredStyle: UIAlertController.Style.alert)
        
        let alertAct = UIAlertAction(title: "Ok", style: .default) { [weak self] alertAction in
            self?.alertView.dismiss(animated: true, completion: nil)
        }
        
        alertView.addAction(alertAct)
        alertView.message = string2
        
        present(alertView, animated: true, completion: nil)
    }

    func setupTextView() {

        textView = UITextView.init(frame: CGRect(x: 10, y: 100, width: view.bounds.width/2, height: view.bounds.height/2))
        textView.center = view.center
        textView.dataDetectorTypes = [UIDataDetectorTypes.phoneNumber , UIDataDetectorTypes.link]
//        textView.contentInsetAdjustmentBehavior = .automatic
        textView.delegate = self

        attributedText = NSMutableAttributedString(string: string1)
        let success = setLinkString(attributeText1:"Điều khoản sử dụng", linkName: "policy")
        if success == true {
            //
        }
        let success1 = setLinkString(attributeText1:"Chính sách bảo mật", linkName: "term")
        if success1 == true {
            //
        }

        textView.attributedText = attributedText
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.green]
        textView.textColor = .black

        view.addSubview(textView)
    }

    func setLinkString( attributeText1:String, linkName:String) -> Bool {

        let range = attributedText.mutableString.range(of: attributeText1)

        if range.location != NSNotFound {
            attributedText.addAttribute(NSAttributedString.Key.link, value: linkName, range: range)
        } else {
            return false
        }

        return true
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange ) -> Bool {

        if URL.absoluteString == "policy" {
            print("This is a policy \n")
            setupButton()
        } else if URL.absoluteString == "term" {
            print("This is a term \n")
        }
        return true;
    }

}
