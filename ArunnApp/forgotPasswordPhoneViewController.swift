//
//  forgotPasswordPhoneViewController.swift
//  ArunnApp
//
//  Created by BYOT on 20/02/23.
//

import UIKit

class forgotPasswordPhoneViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var forgotLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    @IBOutlet weak var phoneTXT: UITextField!
    {
        
        didSet{
            phoneTXT.setphone(image: UIImage.init(named: "telephone")!)
            phoneTXT.tintColor = .darkGray
//            passwordTXT.isSecureTextEntry = true
          }
     }
    @IBOutlet weak var backBTN: UIButton!
    
    
    
    
    @IBOutlet weak var nextBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)

        
        self.phoneTXT.delegate = self
        self.forgotLBL.text = "Forgot Password"
        self.forgotLBL.font = forgotLBL.font.withSize(50)
        
        
        self.infoLBL.text = "Enter your phone number"
        self.infoLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
//        self.infoLBL.textAlignment = .center
        
        self.nextBTN.layer.cornerRadius = 20
        self.nextBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.nextBTN.setTitle("NEXT ", for: .normal )
        self.nextBTN.setTitleColor(UIColor.black, for: .normal)
        nextBTN.titleLabel?.font = .systemFont(ofSize: 30)


        // Do any additional setup after loading the view.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool
   {
       if textField == phoneTXT{
           let maxLength = 10
           let currentString: NSString = phoneTXT.text! as NSString
           let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

       return newString.length <= maxLength
       }
       return true
       
       
       

   }
    func phonenumber(value: String) -> Bool {
                let PHONE_REGEX = "^[0-9]{6,10}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                let result = phoneTest.evaluate(with: value)
                return result
            }

    @IBAction func nextACTION(_ sender: Any) {
        if self.phonenumber(value: self.phoneTXT.text!) == true{
            let push = storyboard?.instantiateViewController(withIdentifier: "forgotPasswordOTPViewController" )  as! forgotPasswordOTPViewController
            self.navigationController?.pushViewController(push, animated: true)
        }
        else{
            let alert = UIAlertController(title: nil, message: "Please enter the phone number.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func backACTION(_ sender: Any) {        self.navigationController?.popViewController(animated: true)
    }
    
}
extension UITextField {
  func setphone(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
}
