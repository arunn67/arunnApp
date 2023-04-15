//
//  paymentViewController.swift
//  ArunnApp
//
//  Created by BYOT on 08/03/23.
//

import UIKit
import SwiftyGif
class paymentViewController: UIViewController {
    
  
    @IBOutlet weak var gifiamge: UIImageView!
    
    @IBOutlet weak var gotoBTN: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.gotoBTN.layer.cornerRadius = 20
        self.gotoBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.gotoBTN.setTitle("BACK", for: .normal )
        self.gotoBTN.setTitleColor(UIColor.black, for: .normal)
        gotoBTN.titleLabel?.font = .systemFont(ofSize: 30)
      
        do {
            let gif = try UIImage(gifName: "Payment.gif")
            self.gifiamge.setGifImage(gif, loopCount: 5) // Will loop 3 times
            gifiamge.frame = view.bounds
            view.addSubview(gifiamge)
        } catch {
            print(error)
        }
    
        

      

        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func goTOACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
