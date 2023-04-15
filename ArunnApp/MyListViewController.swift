//
//  MyListViewController.swift
//  ArunnApp
//
//  Created by BYOT on 27/02/23.
//

import UIKit

class MyListViewController: UIViewController {
    
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var foodIMG: UIImageView!
    @IBOutlet weak var quqlity: UILabel!
    
    @IBOutlet weak var trackorderBTN: UIButton!
    @IBOutlet weak var mylist: UITabBarItem!
    var placeorderDATA = String()
    
    var rcvdata = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodIMG.image = UIImage.init(named: "Briyani")
        self.namelbl.text = "Briyani"
        self.quqlity.text = "2"
        self.trackorderBTN.layer.cornerRadius = 20
        self.trackorderBTN.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.trackorderBTN.setTitle("TRACK ORDER", for: .normal )
        self.trackorderBTN.setTitleColor(UIColor.black, for: .normal)
        trackorderBTN.titleLabel?.font = .systemFont(ofSize: 30)
        

    }
    
    
    @IBAction func MapACT(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "mapVIEWViewController") as! mapVIEWViewController
        self.navigationController?.pushViewController(push, animated: true)
    }
}
