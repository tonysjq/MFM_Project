//
//  CustomCell.swift
//  Mfmproject
//
//  Created by JiangLewei on 29/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import UIKit



class CustomCell: UITableViewCell {

    var marketLocation:String!
    @IBOutlet weak var marketDistance: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    
    @IBOutlet weak var marketName: UILabel!
    
   
    
    func asCircle(){
    
        marketImage.layer.cornerRadius = self.frame.width / 2
        
        marketImage.layer.masksToBounds = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.marketImage.layer.cornerRadius = 20
        
        self.marketImage.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
