//
//  TableViewCell.swift
//  Mfmproject
//
//  Created by Shuaiji Qian on 2/05/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import UIKit

class SpaceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        
        self.userInteractionEnabled = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
