//
//  loginPageViewController.swift
//  ArunnApp
//
//  Created by BYOT on 07/02/23.
//

import UIKit


class loginPageViewController: UIViewController {

    @IBOutlet weak var burgerIMG: UIImageView!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signupBTN: UIButton!
    @IBOutlet weak var plateIMG: UIImageView!
    @IBOutlet weak var orLBL: UILabel!
    
    @IBOutlet weak var googleBTN: UIButton!
    @IBOutlet weak var fbBTN: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        self.googleBTN.setImage(UIImage(named: "google"), for: .normal)
        self.fbBTN.setImage(UIImage(named: "facebook (2)"), for: .normal)
        
        self.signinBtn.layer.cornerRadius = 20
        self.signinBtn.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.signinBtn.setTitle("SIGN IN ", for: .normal )
        self.signinBtn.setTitleColor(UIColor.black, for: .normal)
        signinBtn.titleLabel?.font = .systemFont(ofSize: 30)
        
        self.signupBTN.layer.cornerRadius = 20
        self.signupBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.signupBTN.setTitle("SIGN UP ", for: .normal )
        self.signupBTN.setTitleColor(UIColor.black, for: .normal)
        signupBTN.titleLabel?.font = .systemFont(ofSize: 30)
        
        self.burgerIMG.image = UIImage.init(named: "signinburger")
//

        // Do any additional setup after loading the view.
        burgerIMG.layer.cornerRadius = 20
        burgerIMG.clipsToBounds = true

        burgerIMG.layer.shadowColor = UIColor.darkGray.cgColor
        burgerIMG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        burgerIMG.layer.shadowRadius = 25.0
        burgerIMG.layer.shadowOpacity = 0.9
        self.plateIMG.image = UIImage.init(named: "plate")
        
    
        self.orLBL.text = "Or connect with"
        self.orLBL.textColor = UIColor (red: 97.0/255.0, green: 94.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        self.orLBL.textAlignment = .center
        
    }
    

    @IBAction func signinACTION(_ sender: Any) {
        
        let push = storyboard?.instantiateViewController(withIdentifier: "signinViewController") as! signinViewController
        self.navigationController?.pushViewController(push, animated: true)
        
    }
   
    
    @IBAction func signUPACTION(_ sender: Any) {

        let push = storyboard?.instantiateViewController(withIdentifier: "signUPViewController") as! signUPViewController

        self.navigationController?.pushViewController(push, animated: true)
    }

//
//
//
//
   }
     
     

