//
//  signinViewController.swift
//  ArunnApp
//
//  Created by BYOT on 14/02/23.
//

import UIKit

class signinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signinLBL: UILabel!
    
    @IBOutlet weak var usernameTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    var passbutton = UIButton()
    var iconClick = true
//    arunnnnnnnnnnn
   
    
    
    
    
    
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

        
        
        let emailletfpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.usernameTXT.frame.size.height))
        self.usernameTXT.leftView = emailletfpaddingView
        self.usernameTXT.leftViewMode = .always
        
        let emailimg = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        emailimg.image = UIImage.init(named: "mail")
        emailletfpaddingView.addSubview(emailimg)
        
        let passletfpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.passwordTXT.frame.size.height))
        self.passwordTXT.leftView = passletfpaddingView
        self.passwordTXT.leftViewMode = .always
        
        let passimg = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        passimg.image = UIImage.init(named: "password")
        passletfpaddingView.addSubview(passimg)
        
        
        self.orLBL.text = "Or connect with"
        self.orLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        self.orLBL.textAlignment = .center
        
        self.forgotpassBTN.setTitle("forgot password ? ", for: .normal )
        self.forgotpassBTN.setTitleColor(UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0), for: .normal)
        let rightpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.passwordTXT.frame.size.height))
        self.passwordTXT.rightView = rightpaddingView
        self.passwordTXT.rightViewMode = .always
        
        self.passbutton = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        self.passwordTXT.isSecureTextEntry = true
        passbutton.setImage(UIImage(named: "show"), for: .normal)
        rightpaddingView.addSubview(passbutton)
        
        self.passbutton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        

        

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
    @objc func pressed() {
        if iconClick {
            self.passwordTXT.isSecureTextEntry = false
            passbutton.setImage(UIImage(named: "hide"), for: .normal)
        } else {
            self.passwordTXT.isSecureTextEntry = true
            passbutton.setImage(UIImage(named: "show"), for: .normal)
        }
        iconClick = !iconClick
    }
    
}




    


