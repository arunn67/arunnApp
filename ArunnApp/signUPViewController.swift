//
//  signUPViewController.swift
//  ArunnApp
//
//  Created by BYOT on 17/02/23.
//

import UIKit

class signUPViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var signupLBL: UILabel!
    @IBOutlet weak var orLBL: UILabel!
    @IBOutlet weak var plateIMG: UIImageView!
    @IBOutlet weak var googlrBTN: UIButton!
    
    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var fbBTN: UIButton!
    
    @IBOutlet weak var emailTXT: UITextField!
    
    {
        
        didSet{
            emailTXT.setView(image: UIImage.init(named: "user")!)
            emailTXT.tintColor = .darkGray
//            paswd.isSecureTextEntry = true
        }
        
    }
    @IBOutlet weak var passwordTXT: UITextField!
    
    {
        
        didSet{
            passwordTXT.setView(image: UIImage.init(named: "password")!)
            passwordTXT.tintColor = .darkGray
//            passwordTXT.isSecureTextEntry = true
          }
     }
    @IBOutlet weak var confirmTXT: UITextField!
    
    {
        
        didSet{
            confirmTXT.setView(image: UIImage.init(named: "password")!)
            confirmTXT.tintColor = .darkGray
//            passwordTXT.isSecureTextEntry = true
          }
     }
    @IBOutlet weak var signupBTN: UIButton!
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTXT.delegate = self
        self.passwordTXT.delegate = self
        self.confirmTXT.delegate = self

        self.googlrBTN.setImage(UIImage(named: "google"), for: .normal)
        self.fbBTN.setImage(UIImage(named: "facebook (2)"), for: .normal)
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)


    

        
        self.signupLBL.text = "Sign up"
        self.signupLBL.font = signupLBL.font.withSize(50)
        self.plateIMG.image = UIImage(named: "plate")
        
        self.orLBL.text = "Or connect with"
        self.orLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        self.orLBL.textAlignment = .center
        
       
        
        self.signupBTN.layer.cornerRadius = 20
        self.signupBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.signupBTN.setTitle("SIGN IN ", for: .normal )
        self.signupBTN.setTitleColor(UIColor.black, for: .normal)
        signupBTN.titleLabel?.font = .systemFont(ofSize: 30)
        
        self.emailTXT.placeholder = "email id"
        self.passwordTXT.placeholder = "Password"
        self.confirmTXT.placeholder = "re enter password"
        



        // Do any additional setup after loading the view.
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTXT{
            if self.isValidEmail(email: emailTXT.text!) == true{
                self.passwordTXT.becomeFirstResponder()
            }else{
                emailTXT.becomeFirstResponder()
            }
            
        }else if textField == passwordTXT{
            if self.validpassword(mypassword: passwordTXT.text!) == true{
                self.confirmTXT.becomeFirstResponder()
            }else{
                self.passwordTXT.becomeFirstResponder()
            }
        }else if textField == confirmTXT{
            if self.confirmTXT.text! == self.passwordTXT.text!{
                self.confirmTXT.resignFirstResponder()
            }else{
                self.confirmTXT.becomeFirstResponder()
            }
            
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if self.isValidEmail(email: emailTXT.text!) != true{
            self.emailTXT.becomeFirstResponder()
        }else if self.validpassword(mypassword: passwordTXT.text!) != true{
            self.passwordTXT.becomeFirstResponder()
            
        }else if self.confirmTXT.text! != self.passwordTXT.text!{
            self.confirmTXT.becomeFirstResponder()
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
    
    
    @IBAction func signUPACTION(_ sender: Any) {
        
        if emailTXT.text! != "" {
            
            if self.isValidEmail(email: emailTXT.text!) == true {
                if passwordTXT.text! != ""{
                    if self.validpassword(mypassword: passwordTXT.text!) == true{
                        if confirmTXT.text! == self.passwordTXT.text{
                            let push = storyboard?.instantiateViewController(withIdentifier: "permissionPGViewController") as! permissionPGViewController
                            self.navigationController?.pushViewController(push, animated: true)
                            
                            
                        }else{
                            let alert = UIAlertController(title: nil, message: "Your passwords are not same", preferredStyle: UIAlertController.Style.alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            
                        }
                        
//
                    }else{
                        let alert = UIAlertController(title: nil, message: "Your password must be Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character.", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
//                        self.passwordAlert.backgroundColor = .red

                    }
                    
                }else{
                    let alert = UIAlertController(title: nil, message: "Please Enter The Password.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
//                    self.passwordAlert.backgroundColor = .red

                }
                
            }else{
                let alert = UIAlertController(title: nil, message: "Invalid email.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
//                self.emailAlert.backgroundColor = .red
            }
        }else{
            let alert = UIAlertController(title: nil, message: "Please Enter The Email.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            
//            self.emailAlert.backgroundColor = .red
        }
    }
    
    @IBAction func backACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    }
extension UITextField {
  func setView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
    
    
}
    
    


