//
//  dishTableViewCell.swift
//  ArunnApp
//
//  Created by BYOT on 03/03/23.
//

import UIKit

class dishTableViewCell: UITableViewCell {

    @IBOutlet weak var foodIMG: UIImageView!
    @IBOutlet weak var foodNamLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var placeORDERBTN: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.foodIMG.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
