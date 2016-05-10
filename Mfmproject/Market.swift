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
    private var _markettitleimage:UIImage
    private var _marketlocation:String
    private var _marketDesc:String!
    
    init(name:String,titleimage:UIImage,location:String)
    {self._name=name
     self._markettitleimage=titleimage
     self._marketlocation=location
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
    
    
    var marketlocation:String{
        get{
            return _marketlocation
        }
      
    }
    
    var marketDecs:String{
        get{
            return _marketDesc
        }
        set(newDecs){
            _marketDesc=newDecs
        }
      
    }
    

}