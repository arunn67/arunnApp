//
//  forgotPasswordOTPViewController.swift
//  ArunnApp
//
//  Created by BYOT on 20/02/23.
//

import UIKit

class forgotPasswordOTPViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var forgotLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    @IBOutlet weak var otpTXT: UITextField!
    @IBOutlet weak var nextBTN: UIButton!
    
    @IBOutlet weak var backBTN: UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)

        self.otpTXT.delegate = self
        self.forgotLBL.text = "Forgot Password"
        self.forgotLBL.font = forgotLBL.font.withSize(50)
        
        self.infoLBL.text = "An oto code sent to your phone Enter here"
        self.infoLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
//        self.infoLBL.textAlignment = .center
        
        
        self.otpTXT.placeholder  = "OTP"
        
        self.nextBTN.layer.cornerRadius = 20
        self.nextBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.nextBTN.setTitle("NEXT ", for: .normal )
        self.nextBTN.setTitleColor(UIColor.black, for: .normal)
        nextBTN.titleLabel?.font = .systemFont(ofSize: 30)


        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextACT(_ sender: Any) {
    }
    
    @IBAction func backACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
}
