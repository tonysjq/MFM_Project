//
//  Market.swift
//  Mfmproject
//
//  Created by Shuaiji Qian on 1/05/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import Foundation
class Market{
    private var _name:String
    private var _markettitleimage:UIImage?
    
    init(name:String,titleimage:UIImage?)
    {self._name=name
     self._markettitleimage=titleimage
    }
    var name:String{
        get{
            return _name
        }
    }

    var markettitleimage:UIImage?{
        get{
            return _markettitleimage
        }
    
    
    }

}