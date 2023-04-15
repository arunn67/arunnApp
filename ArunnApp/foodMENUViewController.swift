//
//  foodMENUViewController.swift
//  ArunnApp
//
//  Created by BYOT on 03/03/23.
//

import UIKit

class foodMENUViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var foodIMG: UIImageView!
    @IBOutlet weak var foodNamLBL: UILabel!
    @IBOutlet weak var foodCOSTLBL: UILabel!
    @IBOutlet weak var quandityLBL: UILabel!
    @IBOutlet weak var countSTEP: UIStepper!
    @IBOutlet weak var orderVIEW: UIView!
    
    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var placeorderBTN: UIButton!
    @IBOutlet weak var cancleBTN: UIButton!
    var dataa = [String:String]()
    var stepCOU = String()
    
    
    @IBOutlet weak var dishTBL: UITableView!
    var food = [String]()
    var juice = [String]()
    var rcv = String()
    
    var item = [String]()
    var price = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dishTBL.delegate = self
        self.dishTBL.dataSource = self
        self.foodIMG.layer.cornerRadius = 20
        
        self.orderVIEW.isHidden = true
        countSTEP.autorepeat = true
        countSTEP.isContinuous = true
        countSTEP.maximumValue = 10
        countSTEP.minimumValue = 0
        quandityLBL.text = self.stepCOU
        self.quandityLBL.text = "0"
        
        print(countSTEP.value)
        quandityLBL.textAlignment = .center
        orderVIEW.backgroundColor =  UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        orderVIEW.layer.cornerRadius = 20
        self.foodNamLBL.textAlignment = .center
        self.foodCOSTLBL.textAlignment = .center
        self.placeorderBTN.setTitle("PLACE ORDER", for: .normal )
        self.foodIMG.layer.cornerRadius = 20
        orderVIEW.layer.cornerRadius = 20
        placeorderBTN.backgroundColor = UIColor.white
        self.cancleBTN.setTitle("CANCEL", for: .normal )
        self.cancleBTN.backgroundColor = UIColor.white
        cancleBTN.layer.cornerRadius = 20
        placeorderBTN.layer.cornerRadius = 20
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)

        
        
    


        if rcv == "food"{
            self.item = ["Briyani","Chicken Briyani","Chicken Noodles","Chicken tandori","Chicken65","ChickenFriedrice","dosa","ghee dosa","Fish Briyani","Grill Chicken","mushroom pizza","Mushroom gravy","paneer dosa","paniyaram","podi dosa","pongal","poori","rava dosa","sweet pongal","veg pizza"]
            self.price = ["120","200","","80","520","100","80","25","50","250","600","525","300","75","35","60","50","40","70","60","200"]
            
        }else if rcv == "drink"{
        
        self.item = ["Apple juice","Grape juice","Mango juice","Orange juice","Watermelon juice","Pineapple juice"]
            self.price = ["100","150","50","70","50","150"]
        }
        else if rcv == "cake2"{
            
            self.item = ["Black Forest","cake","Church Flyer","Red velvet","Venila"]
            self.price = ["1000","150","1200","1300","500"]
        }
        else if rcv == "snack"{
            self.item = ["bajji","bonda","corn","pani Puri","pufs","samosa","vada"]
            self.price = ["25","15","120","30","50","30","30"]
            
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishTableViewCell", for: indexPath) as! dishTableViewCell
        cell.foodIMG.image = UIImage.init(named: self.item[indexPath.row])
        cell.foodNamLBL.text =  self.item[indexPath.row]
        cell.priceLBL.text = self.price[indexPath.row]
        cell.foodIMG.layer.cornerRadius = 20
                return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.orderVIEW.isHidden = false
        self.foodIMG.image = UIImage.init(named: self.item[indexPath.row])
        self.foodNamLBL.text =  self.item[indexPath.row]
        self.foodCOSTLBL.text = self.price[indexPath.row]
        let push = storyboard?.instantiateViewController(withIdentifier: "MyListViewController") as! MyListViewController
        
        
        self.dataa = ["name":"\(self.item[indexPath.row])","img":"\(self.item[indexPath.row])" ,"pri":"\(self.price[indexPath.row])",]
    
        push.rcvdata = self.dataa
        
        
        print(dataa)
    }
    
    @IBAction func placeACT(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "checkoutViewController") as! checkoutViewController
        self.navigationController?.pushViewController(push, animated: true)
        push.checkDATA = self.dataa
        push.checkDATA["qua"] = self.stepCOU
        
    }
    
    @IBAction func cancelACT(_ sender: Any) {
        self.orderVIEW.isHidden = true
    }
    
    
    @IBAction func stepACT(_ sender: UIStepper) {
        
        if sender.value == 0.0{
            self.stepCOU = "0"
            
        }else if sender.value == 1.0{
            self.stepCOU = "1"
        }
        else if sender.value == 2.0{
            self.stepCOU = "2"
            
        }else if sender.value == 3.0{
            self.stepCOU = "3"
            
        }else if sender.value == 4.0{
            self.stepCOU = "4"
            
        }else if sender.value == 5.0{
            self.stepCOU = "5"
            
        }else if sender.value == 6.0{
            self.stepCOU = "6"
            
        }else if sender.value == 7.0{
            self.stepCOU = "7"
            
        }else if sender.value == 8.0{
            self.stepCOU = "8"
            
        }else if sender.value == 9.0{
            self.stepCOU = "9"
            
        }else if sender.value == 10.0{
            self.stepCOU = "10"
            
            
        }
        self.quandityLBL.text = self.stepCOU

    }

    @IBAction func backACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
