//
//  permissionPGViewController.swift
//  ArunnApp
//
//  Created by BYOT on 20/02/23.
//

import UIKit

class permissionPGViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    
    @IBOutlet weak var home: UITabBarItem!
    @IBOutlet weak var menuCOLL: UICollectionView!
    @IBOutlet weak var itemCOLL: UICollectionView!
    
    @IBOutlet weak var orderIMG: UIImageView!
    @IBOutlet weak var countLBL: UILabel!
    @IBOutlet weak var countSTEP: UIStepper!
    
    @IBOutlet weak var placeoredeBTN: UIButton!
    @IBOutlet weak var placeorderVIEW: UIView!
    
    @IBOutlet weak var cancleBTN: UIButton!
    
    
    
    var stepCOU = String()
    var itemARR = [String]()
    var itemNAM = [String]()
    var arun = UICollectionViewCell()
    var menuITM = [String]()
    var menuPRI = [String]()
    var str = 0
    var menuARR = [String]()
    var dataa = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemCOLL.delegate = self
        self.itemCOLL.dataSource = self
        self.menuCOLL.delegate = self
        self.menuCOLL.dataSource = self
        self.countLBL.text = "0"
        
        
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 121, height: 78)
        flowlayout.minimumLineSpacing = 20
        flowlayout.minimumInteritemSpacing = 50
        flowlayout.scrollDirection = .horizontal
        self.itemCOLL.collectionViewLayout = flowlayout
        
        let flowlayoutt = UICollectionViewFlowLayout()
        flowlayoutt.itemSize = CGSize(width: 185, height: 186)
        flowlayoutt.minimumLineSpacing = 20
        flowlayoutt.minimumInteritemSpacing = 50
        flowlayoutt.scrollDirection = .horizontal
        self.menuCOLL.collectionViewLayout = flowlayoutt
        
        self.itemARR = ["drink","food", "cake2","snack"]
        self.itemNAM = ["drink","food", "cake","snack"]
        self.menuITM = ["Briyani","dosa","Mushroom","signinburger","vada","ghee dosa"]
        self.menuPRI = ["500","30","600","200","25","50"]
        self.orderIMG.layer.cornerRadius = 20
        
        countSTEP.autorepeat = true
        countSTEP.isContinuous = true
        countSTEP.maximumValue = 10
        countSTEP.minimumValue = 0
        countLBL.text = self.stepCOU
        self.placeorderVIEW.isHidden = true
        print(countSTEP.value)
        countLBL.textAlignment = .center
        placeorderVIEW.backgroundColor =  UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        placeoredeBTN.layer.cornerRadius = 20
        self.placeoredeBTN.setTitle("PLACE ORDER", for: .normal )
        self.orderIMG.layer.cornerRadius = 20
        placeorderVIEW.layer.cornerRadius = 20
        placeoredeBTN.backgroundColor = UIColor.white
        
        cancleBTN.backgroundColor =  UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        cancleBTN.layer.cornerRadius = 20
        self.cancleBTN.setTitle("CANCEL", for: .normal )
        self.cancleBTN.layer.cornerRadius = 20
        cancleBTN.layer.cornerRadius = 20
        cancleBTN.backgroundColor = UIColor.white
        
        

        

        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       var num = 0
        if collectionView == itemCOLL{
            num = itemARR.count
        }else if collectionView == menuCOLL{
            num = menuITM.count
        }
    
            
      
        
        return num

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == itemCOLL{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! itemCollectionViewCell
        cell.foodIMG.image = UIImage .init(named: self.itemARR[indexPath.row])
            cell.foodIMG.layer.cornerRadius = 20
            cell.foodIMG.clipsToBounds = true

        
        cell.foodLBL.text = self.itemNAM[indexPath.row]
            self.arun = cell
        
        }
        else if collectionView == menuCOLL{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCollectionViewCell", for: indexPath) as! menuCollectionViewCell
            
            cell.menuIMG.image = UIImage.init(named: self.menuITM[indexPath.item])
            cell.menuIMG.layer.cornerRadius = 20
            cell.menuIMG.clipsToBounds = true
            
            self.arun = cell
           
        }
            return arun
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == itemCOLL{
            let push = storyboard?.instantiateViewController(withIdentifier: "foodMENUViewController") as! foodMENUViewController
            self.navigationController?.pushViewController(push, animated: true)
            push.rcv = itemARR[indexPath.item]
            print(self.itemARR[indexPath.item])


        }else if collectionView == menuCOLL{
//            let cell = collectionView.cellForItem(at: indexPath) as! menuCollectionViewCell
            self.placeorderVIEW.isHidden = false
            
            self.orderIMG.image = UIImage.init(named: self.menuITM[indexPath.item])
            
            
            
            self.dataa = ["name":"\(self.menuITM[indexPath.row])","img":"\(self.menuITM[indexPath.row])" ,"pri":"\(self.menuPRI[indexPath.row])"]
             
            
            
        }
       
        print(menuARR)
        DispatchQueue.main.async {
            self.itemCOLL.reloadData()
            self.menuCOLL.reloadData()
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func stepperACTION(_ sender: UIStepper) {
        
        
        
        
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
        self.countLBL.text = self.stepCOU
    }
    
    @IBAction func placeorder(_ sender: Any) {
        let push = storyboard?.instantiateViewController(withIdentifier: "checkoutViewController") as! checkoutViewController
        self.navigationController?.pushViewController(push, animated: true)
        push.checkDATA = self.dataa
        push.checkDATA["qua"] = self.stepCOU
    }
    
    @IBAction func cancleACT(_ sender: Any) {
        self.placeorderVIEW.isHidden = true
        
    }
    
}
extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.backgroundColor = color
  }
}
