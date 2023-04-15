//
//  checkoutViewController.swift
//  ArunnApp
//
//  Created by BYOT on 06/03/23.
//

import UIKit

class checkoutViewController: UIViewController, UITextFieldDelegate {
    
    var checkDATA = [String:String]()
    
    @IBOutlet weak var checkIMG: UIImageView!
    @IBOutlet weak var checkNAM: UILabel!
    @IBOutlet weak var checkPRI: UILabel!
    @IBOutlet weak var checkCOU: UILabel!
    @IBOutlet weak var addressLBL: UILabel!
    @IBOutlet weak var doornoTXT: UITextField!
    @IBOutlet weak var cityTXT: UITextField!
    @IBOutlet weak var pincodeTXT: UITextField!
    @IBOutlet weak var placrORDER: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(checkDATA)
        
        self.checkIMG.layer.cornerRadius = 20
        self.addressLBL.text = "ADDRESS"
        
        self.checkIMG.image = UIImage.init(named: self.checkDATA["img"]!)
        self.checkIMG.layer.cornerRadius = 20
        self.checkNAM.text = "\(self.checkDATA["name"]!)"
        self.checkPRI.text = "\(self.checkDATA["pri"]!)"
        self.checkCOU.text = "\(self.checkDATA["qua"]!)"
        self.doornoTXT.placeholder = "Door No"
        self.cityTXT.placeholder = "City Name"
        self.pincodeTXT.placeholder = "PIN Code"
        
        
        self.placrORDER.layer.cornerRadius = 20
        self.placrORDER.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.placrORDER.setTitle("PLACE ORDER", for: .normal )
        self.placrORDER.setTitleColor(UIColor.black, for: .normal)
        placrORDER.titleLabel?.font = .systemFont(ofSize: 30)
        self.cancelBTN.layer.cornerRadius = 20
        self.cancelBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.cancelBTN.setTitle("CANCEL", for: .normal )
        self.cancelBTN.setTitleColor(UIColor.black, for: .normal)
        cancelBTN.titleLabel?.font = .systemFont(ofSize: 30)
        
        
        
    }
    
    @IBAction func placrACT(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "paymentViewController") as! paymentViewController
        self.navigationController?.pushViewController(push, animated: true)
        
    }
    
    @IBAction func cancleACT(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
