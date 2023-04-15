//
//  ViewController.swift
//  ArunnApp
//
//  Created by BYOT on 06/02/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
   
    
    @IBOutlet weak var infocollection: UICollectionView!
    @IBOutlet weak var GETSTARTEDBTN: UIButton!
    @IBOutlet weak var infoPagecontroll: UIPageControl!
    
    let infoIMset = ["food","delivery","payment","award"]
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.infocollection.delegate = self
        self.infocollection.dataSource = self
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 414, height: 926)
        flowlayout.minimumLineSpacing = 0
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.scrollDirection = .horizontal
        self.infocollection.isScrollEnabled = false
        self.infocollection.backgroundColor = UIColor (red: 244.0/255.0, green: 91.0/255.0, blue: 3/255.0, alpha: 1.0)
        self.infocollection.collectionViewLayout = flowlayout
        
        self.GETSTARTEDBTN.backgroundColor = UIColor (red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        self.GETSTARTEDBTN.layer.cornerRadius = 20
        self.GETSTARTEDBTN.setTitle("Get Started", for: .normal)
        self.GETSTARTEDBTN.isHidden = true
        self.infoPagecontroll.numberOfPages = self.infoIMset.count
        self.infoPagecontroll.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
           }
        
        
        
        
        
    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCollectionViewCell", for: indexPath) as! infoCollectionViewCell
        cell.infoIMG.image = UIImage.init(named: infoIMset[indexPath.item])

        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
       
    
    }
    
    @objc func changeImage() {

         if counter < infoIMset.count {
              let index = IndexPath.init(item: counter, section: 0)
              self.infocollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             self.infoPagecontroll.currentPage = counter
              counter += 1
             if self.infoPagecontroll.currentPage == 3 {
                 self.GETSTARTEDBTN.isHidden = false
             }else{
                 self.GETSTARTEDBTN.isHidden = true
             }
             
             
                    
         } else {
             self.timer.invalidate()
            
           }
      }

    @IBAction func GetStaetedAction(_ sender: Any) {
        self.performSegue(withIdentifier: "Loginpage", sender: nil)
        self.GETSTARTEDBTN.backgroundColor = UIColor.white
        self.GETSTARTEDBTN.setTitleColor(UIColor.black, for: .normal)
        
    }
    
}

