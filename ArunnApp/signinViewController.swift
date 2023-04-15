//
//  signinViewController.swift
//  ArunnApp
//
//  Created by BYOT on 14/02/23.
//

import UIKit

class signinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signinLBL: UILabel!
    
    @IBOutlet weak var usernameTXT: UITextField!{
        
        didSet{
            usernameTXT.setLeftView(image: UIImage.init(named: "user")!)
            usernameTXT.tintColor = .darkGray
//            paswd.isSecureTextEntry = true
          }
     }
    
    
    @IBOutlet weak var passwordTXT: UITextField!
    {
        
        didSet{
            passwordTXT.setLeftView(image: UIImage.init(named: "password")!)
            passwordTXT.tintColor = .darkGray
//            passwordTXT.isSecureTextEntry = true
          }
     }
    
    @IBOutlet weak var signinBTN: UIButton!
    
    @IBOutlet weak var emailAlert: UILabel!
    @IBOutlet weak var plateIMG: UIImageView!
    @IBOutlet weak var passwordAlert: UILabel!
    @IBOutlet weak var forgotpassBTN: UIButton!
   
    @IBOutlet weak var orLBL: UILabel!
    
    @IBOutlet weak var googleBTN: UIButton!
    
    @IBOutlet weak var fbBTN: UIButton!
    
    @IBOutlet weak var backBTN: UIButton!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.plateIMG.image = UIImage(named: "plate")
        
        self.usernameTXT.delegate = self
        self.passwordTXT.delegate = self
        
        self.signinLBL.text = "Sign in"
        self.signinLBL.font = signinLBL.font.withSize(50)
        
        
        self.signinBTN.layer.cornerRadius = 20
        self.signinBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.signinBTN.setTitle("SIGN IN ", for: .normal )
        self.signinBTN.setTitleColor(UIColor.black, for: .normal)
        signinBTN.titleLabel?.font = .systemFont(ofSize: 30)
        
        self.usernameTXT.placeholder = "   email id"
        self.passwordTXT.placeholder = "   Password"

        
        self.googleBTN.setImage(UIImage(named: "google"), for: .normal)
        self.fbBTN.setImage(UIImage(named: "facebook (2)"), for: .normal)
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)

        
        
        class TextField: UITextField {

            let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

            override open func textRect(forBounds bounds: CGRect) -> CGRect {
                return bounds.inset(by: padding)
            }

            override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
                return bounds.inset(by: padding)
            }

            override open func editingRect(forBounds bounds: CGRect) -> CGRect {
                return bounds.inset(by: padding)
            }
        }
        
        
        
        self.orLBL.text = "Or connect with"
        self.orLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        self.orLBL.textAlignment = .center
        
        self.forgotpassBTN.setTitle("forgot password ? ", for: .normal )
        self.forgotpassBTN.setTitleColor(UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0), for: .normal)
        

        

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTXT{
            if self.isValidEmail(email: usernameTXT.text!) == true{
                self.passwordTXT.becomeFirstResponder()
            }else{
                usernameTXT.becomeFirstResponder()
            }
            
        }else if textField == passwordTXT{
            if self.validpassword(mypassword: passwordTXT.text!) == true{
                self.passwordTXT.resignFirstResponder()
            }else{
                self.passwordTXT.becomeFirstResponder()
            }
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if self.isValidEmail(email: usernameTXT.text!) != true{
            self.usernameTXT.becomeFirstResponder()
        }else if self.validpassword(mypassword: passwordTXT.text!) != true{
            self.passwordTXT.becomeFirstResponder()
            
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == usernameTXT{
            if self.isValidEmail(email: usernameTXT.text!) != true{
//                self.emailAlert.backgroundColor = .red
            }else{
//                self.emailAlert.backgroundColor = .lightGray
            }
    }else if textField == passwordTXT{
        if self.validpassword(mypassword: passwordTXT.text!) != true{
//            self.passwordAlert.backgroundColor = .red
        }else{
//            self.passwordAlert.backgroundColor = .lightGray
        }
}
    }
    
    func validpassword(mypassword : String) -> Bool
        {

            let passwordreg =  ("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
)
            let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
            return passwordtesting.evaluate(with: mypassword)
        }
    func isValidEmail( email: String) -> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    @IBAction func signinACTION(_ sender: Any) {
        
        if usernameTXT.text! != "" {
            
            if self.isValidEmail(email: usernameTXT.text!) == true {
                if passwordTXT.text! != ""{
                    if self.validpassword(mypassword: passwordTXT.text!) == true{
                        let push = storyboard?.instantiateViewController(withIdentifier: "tabViewController") as! tabViewController
                        
                        self.navigationController?.pushViewController(push, animated: true)
                        
                    }else{
                        let alert = UIAlertController(title: nil, message: "Your password must be Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character.", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)

                    }
                    
                }else{
                    let alert = UIAlertController(title: nil, message: "Please Enter The Password.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)

                }
                
            }else{
                let alert = UIAlertController(title: nil, message: "Invalid email.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: nil, message: "Please Enter The Email.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            

        }
    }
    
    @IBAction func forgotBTN(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "forgotPasswordPhoneViewController") as! forgotPasswordPhoneViewController
        
        self.navigationController?.pushViewController(push, animated: true)
        
    }
    
    @IBAction func backACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
}



extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
    
    
    
}

